import maya.cmds as cmds
import time

from ..rigbase import modules

from ..rig import limbs
from ..rig import spine

from ..rigbase import base

# WIP
import maya.mel as mel

from ..utils import shapes
from ..utils import controlers
from ..utils import joints
from ..utils import constraints
from ..utils import hooks
from ..utils import nodes

from ..tools import hierarchies

from ..rig import hand

# rigit
import os
import sys

from importlib import reload

path = r'\\Storage01\3d4\seaOfLeaves\11_scripts\autoRig'

if os.getcwd() != path:
    os.chdir(path)

sys.path.insert(0, path)

import rigit
reload(rigit)


#===============================================================================
# GLOBAL scene object names
#===============================================================================

# group
buildSkeletonGrp = 'GRP_template_biped'

# sides
lside = '_L'
rside = '_R'
cside = '_C'

# curves
spineCrv = 'CRV_spine' + cside
neckCrv = 'CRV_neck' + cside

# joints template
headJnt = 'TPL_head_01' + cside
jawJnt = 'TPL_jaw_01' + cside
upperjawJnt = 'TPL_upper_jaw_01' + cside
eyeJnt = 'TPL_eye_01'

neckJnt = 'TPL_neck_01' + cside

spineJnt = 'TPL_spine_01' + cside

clavicleJnt = 'TPL_clavicle_01'
scapulaJnt = 'TPL_scapula_01'

shoulderJnt = 'TPL_shoulder'
elbowJnt = 'TPL_elbow'
wristJnt = 'TPL_wrist'

femurJnt = 'TPL_femur'
kneeJnt = 'TPL_knee'
ankleJnt = 'TPL_ankle'

footAnkleJnt = 'TPL_foot_ankle'
toesJnt = 'TPL_toes'

handJnt = 'TPL_hand'

#===============================================================================


def build (
        characterName = '',
        rigScale = 1.0,
        addAutoStretch = True,
        doBendTwist = False,
        worldOrientFoot = True,
        loadCtrlShape = True,
        hideRmanAttrs = False
        ):


    start_time = time.time()

    #---------------------------------------
    # import template scene
    #---------------------------------------

    import_template()

    #===============================================================================
    # define scene object names
    #===============================================================================

    # scale
    global sceneScale
    sceneScale = rigScale

    # assemblate GLOBAL obj names

    global headJnts
    try : headJnts = [headJnt] + cmds.listRelatives(headJnt, ad=1, type='joint')[::-1]
    except : headJnts = []

    global neckJnts
    try : neckJnts = [neckJnt] + cmds.listRelatives(neckJnt, ad=1, type='joint')[::-1]
    except : neckJnts = []

    global spineJnts
    try : spineJnts = [spineJnt] + cmds.listRelatives(spineJnt, ad=1, type='joint')[::-1]
    except : spineJnts = []

    global armL_jnts
    global armR_jnts
    armL_jnts = [shoulderJnt + lside, elbowJnt + lside, wristJnt + lside]
    armR_jnts = [shoulderJnt + rside, elbowJnt + rside, wristJnt + rside]

    global legL_jnts
    global legR_jnts
    legL_jnts = [femurJnt + lside, kneeJnt + lside, ankleJnt + lside]
    legR_jnts = [femurJnt + rside, kneeJnt + rside, ankleJnt + rside]


    #===============================================================================
    # Build setup
    #===============================================================================

    #---------------------------------------
    # rig base
    #---------------------------------------

    base.build(
        assetName = characterName,
        scale = sceneScale
        )


    #---------------------------------------
    # legs
    #---------------------------------------

    for jnts in [legL_jnts, legR_jnts] :
        
        if jnts == legL_jnts :
            colorIK = 'lightBlue'
            colorFK = 'lightBlue'
            colorTW = 'blue'

        if jnts == legR_jnts :
            colorIK = 'red'
            colorFK = 'red'
            colorTW = 'orange'

        limbs.build( 
                templateChain=jnts,
                fkCtrls=['circle', colorFK, sceneScale],
                ikCtrls=['circle', colorIK, sceneScale/2],
                attrCtrl=['gear', 'pink', sceneScale/4],
                ikType='rotate_plane',
                splineCurve='',
                doWorldAlignedEnd=worldOrientFoot,
                addAutoStretch=addAutoStretch,
                snapPV=True,
                radius=sceneScale,
                doBendTwist=doBendTwist,
                twCtrls=[3, 'circle', colorTW, sceneScale],
                jntNumber=5
                )

    #---------------------------------------
    # arms
    #---------------------------------------

    for jnts in [armL_jnts, armR_jnts] :

        if jnts == armL_jnts :
            colorIK = 'lightBlue'
            colorFK = 'lightBlue'
            colorTW = 'blue'

        if jnts == armR_jnts :
            colorIK = 'red'
            colorFK = 'red'
            colorTW = 'orange'

        limbs.build( 
                templateChain=jnts,
                fkCtrls=['circle', colorFK, sceneScale],
                ikCtrls=['circle', colorIK, sceneScale/2],
                attrCtrl=['gear', 'pink', sceneScale/4],
                ikType='rotate_plane',
                splineCurve='',
                doWorldAlignedEnd=False,
                addAutoStretch=addAutoStretch,
                snapPV=True,
                radius=sceneScale,
                doBendTwist=doBendTwist,
                twCtrls=[3, 'circle', colorTW, sceneScale],
                jntNumber=5
                )

    #---------------------------------------
    # spine
    #---------------------------------------

    spine.build( 
            templateChain=spineJnts,
            fkCtrls=['circle', 'yellow', sceneScale],
            ikCtrls=['circle', 'darkYellow', sceneScale*0.85],
            radius=sceneScale,
            doBendTwist=True,
            jntNumber=7,
            UVsMode=0,
            createEnd=True
            )

    
    #===============================================================================
    # WIP - will change in individual fonctions
    #===============================================================================


    clavicle_build()
    spine_build()
    arm_build()
    leg_build()
    hand_build()
    neck_build()
    head_build()
    foot_build()

    controlers_visual()

    data_groups()
    cleaning()

    if loadCtrlShape == True:
        load_ctrlShape()

    delete_template()

    if hideRmanAttrs == True:
        hide_rman_attrs()


    end_time = time.time()
    elapsed_time = end_time - start_time

    message = f"<font color=lightgreen> RIG builded in: <font> <font color=white>{elapsed_time}<font> <font color=lightgreen>s"
    cmds.inViewMessage(amg=message, pos="midCenter", fade=True, fadeInTime=200, fadeStayTime=5000, fadeOutTime=200)
    print(f'RIG builded in: {elapsed_time} s')

def build_facial ():
    ''
    
def import_template (path = r'\\Storage01\3d4\seaOfLeaves\04_asset\character\captain\maya\scenes\edit\rig\utils\templates\captain_template_publish.ma'):
    cmds.file(path, i=1, defaultNamespace=True, resetError=1)

def delete_template (*args):

    cmds.delete('GRP_template_biped')

def controlers_visual (*args):

    # replace shapes

    shapes.shape_replace(childs=['CTRL_ik_shoulder_L', 'CTRL_ik_femur_L'], shape='circle', color='lightBlue', scale=[11*sceneScale, 11*sceneScale, 11*sceneScale])
    shapes.shape_replace(childs=['CTRL_ik_shoulder_R', 'CTRL_ik_femur_R'], shape='circle', color='red', scale=[11*sceneScale, 11*sceneScale, 11*sceneScale])

    shapes.rotate('CTRL_ik_wrist_L', [0, 180, 90])
    shapes.rotate('CTRL_ik_wrist_R', [0, 0, 90])


    # rotate shapes

    # for ctrlTW in cmds.ls('CTRL_TW_*Shape'):
    #     shapes.rotate(ctrlTW, [90, 0, 0])

    for ctrlIK in cmds.ls('CTRL_ik_ankle*Shape'):
        shapes.rotate(ctrlIK, [90, 0, 0])

    for ctrlIK in cmds.ls('CTRL_ik_spine_*Shape'):
        shapes.rotate(ctrlIK, [90, 0, 0])

    for ctrlIK in cmds.ls('CTRL_ik_neck_*Shape'):
        shapes.rotate(ctrlIK, [90, 0, 0])

    for ctrlIK in cmds.ls('CTRL_toes_*_LShape'):
        shapes.rotate(ctrlIK, [0, 0, 180])

    for ctrlIK in cmds.ls('CTRL_ik_metacarp_*Shape'):
        shapes.rotate(ctrlIK, [180, 90, 0])

    shapes.rotate('CTRL_ik_ankle_L', [90, 0, 0])
    shapes.rotate('CTRL_ik_ankle_R', [90, 0, 0])

    shapes.rotate('CTRL_hand_L', [90, 0, 0])
    shapes.rotate('CTRL_hand_R', [90, 0, 0])

    shapes.rotate('CTRL_fk_neck_03_C', [90, 0, 0])


    # thickness

    cmds.setAttr('CTRL_fk_spine_01_CShape.lineWidth', 3)

def clavicle_build (*args):

    #---------------------------------------
    # clavicle / scapula
    #---------------------------------------

    for side in [lside, rside]:

        dataGrpClavicle = cmds.createNode('transform', n='GRP_build_clavicle' + side, ss=1)


        # joints

        tplJnt = [clavicleJnt + side] + cmds.listRelatives(clavicleJnt + side, ad=1, type='joint')[::-1]
        skClavicle = joints.create_sk_chain(refChain=tplJnt, parent=dataGrpClavicle, radius=2.0)


        # controler

        for jnt in [skClavicle[0], skClavicle[-2]]:
            
            hierarchyClavicle = controlers.controler_hierarchy(names=[jnt.split('_')[1] + side], parent=dataGrpClavicle, cstrGroup=False, scale=5*sceneScale, shape="circle", color="lightBlue")[0]
            off = hierarchyClavicle[0]
            ctrl = hierarchyClavicle[-1]

            cmds.matchTransform(off, jnt)
            constraints.matrixConstraint(ctrl, jnt)
            

            if jnt == skClavicle[0]:
                
                if side == lside :
                    shapes.rotate(ctrl, [90, 180, 90])

                if side == rside :
                    shapes.rotate(ctrl, [90, 0, 90])
                    controlers.ctrl_color(ctrl, 'red')
                    

            if jnt == skClavicle[-2]:
                
                if side == lside :
                    color = 'lightBlue'
                if side == rside :
                    color = 'red'

                shapes.shape_replace(childs=[ctrl], shape='circle', color=color, scale=[5*sceneScale, 5*sceneScale, 5*sceneScale])

                if side == lside :
                    shapes.rotate(ctrl, [90, 0, 90])
                
                if side == rside :
                    shapes.rotate(ctrl, [90, 180, 90])
                    controlers.ctrl_color(ctrl, 'red')


        # fk hierarchy

        cmds.parent('OFF_scapula' + side, 'CTRL_clavicle' + side)

        
        # constraint ik for scapula

        ikHandle = joints.ik_rotate_plane_handle(
            startJoint = skClavicle[-2], 
            endEffector = skClavicle[-1],
            parent = dataGrpClavicle
            )[0]

        cmds.parent(ikHandle, 'SK_clavicle_02' + side)

        # connect arms

        targetClavicle = cmds.createNode('transform', n='target_attach_arms' + side, p='CTRL_clavicle' + side, ss=1)
        hooks.create_hook(targetClavicle, 'OFF_fk_shoulder' + side, '_fk'+side)
        hooks.create_hook(targetClavicle, 'OFF_ik_shoulder' + side, '_ik'+side)

def spine_build (*args):

    #---------------------------------------
    # spine
    #---------------------------------------

    # connect clavicle

    targetClavicle = cmds.createNode('transform', n='target_attach_clavicles', p='CTRL_fk_spine_04_C', ss=1)
    for side in [lside, rside]:
        hook = hooks.create_hook(targetClavicle, 'OFF_clavicle' + side)
        cmds.rename(hook, hook + side)

    # connect legs

    targetLegs = cmds.createNode('transform', n='target_attach_legs', p='CTRL_ik_spine_01_C', ss=1)
    for side in [lside, rside]:
        hooks.create_hook(targetLegs, 'OFF_fk_femur' + side, '_fk'+side)
        hooks.create_hook(targetLegs, 'OFF_ik_femur' + side, '_ik'+side)

def arm_build (*args):

    #---------------------------------------
    # arms
    #---------------------------------------
    
    # connect ctrl attr

    for side in [lside, rside]:
        cstr = controlers.add_cstr(controlers = ['CTRL_attr_arm' + side])[0]
        cmds.pointConstraint('SK_lower_arm_05' + side, cstr, mo=1)


        # twist correction
            
        cmds.delete(f'CSTR_TW_lower_arm_03{side}_parentConstraint1')

        cstrTW03 = cmds.parentConstraint([f'CTRL_fk_wrist{side}', f'CTRL_ik_wrist{side}'], f'CSTR_TW_lower_arm_03{side}', sr='y', mo=1)[0]
        cmds.connectAttr('fcst_switch_fk_wrist' + side + '.outFloat', f'{cstrTW03}.CTRL_fk_wrist{side}W0')
        cmds.connectAttr('rv_switch_fk_wrist' + side + '.outputX', f'{cstrTW03}.CTRL_ik_wrist{side}W1')

        constraints.matrixConstraint(parent='SK_elbow' + side, child=f'CSTR_TW_lower_arm_03{side}', transforms=['rotateY'])

def leg_build (*args):

    #---------------------------------------
    # legs
    #---------------------------------------

    # connect ctrl attr

    for side in [lside, rside]:
        cstr = controlers.add_cstr(controlers = ['CTRL_attr_leg' + side])[0]
        cmds.pointConstraint('SK_lower_leg_05' + side, cstr, mo=1)

def hand_build (*args):

    #---------------------------------------
    # hand
    #---------------------------------------
    
    for side in [lside, rside]:

        dataGrpHand = cmds.createNode('transform', n='GRP_build_hand' + side, ss=1)


        # joints
        
        tplHandJnts = cmds.duplicate(handJnt + side, renameChildren=1)
        cmds.parent(tplHandJnts[0], dataGrpHand)

        handJnts = []
        for jnt in tplHandJnts :
            shortName = '_'.join(jnt.split('_')[1:-1])
            name = cmds.rename(jnt, 'SK_' + shortName + side)

            handJnts.append(name)


        # controlers

        if side == lside :
            color = 'blue'
        if side == rside :
            color = 'orange'
        
        snNames = ['_'.join(jnt.split('_')[1:]) for jnt in handJnts]
        handHierarchies = controlers.controler_hierarchy(names=snNames, parent=dataGrpHand, cstrGroup=False, scale=2 * sceneScale, shape="circle", color=color)

        for i in range(len(handHierarchies)):

            off = handHierarchies[i][0]
            cmds.matchTransform(off, handJnts[i])

            if len(handJnts) > i > 0:

                skParentCTRL = cmds.listRelatives(handJnts[i], parent=1)[0].replace('SK', 'CTRL')
                cmds.parent(off, skParentCTRL)

        offMetacarps = cmds.ls(f'OFF_metacarp_*{side}')[0:-1] # exclude thumb
        
        offMetacarpsIK = []
        ctrlMetacarpsIK = []

        for off in offMetacarps :
            offName = cmds.rename(off, '_'.join(off.split('_')[:1] + ['ik'] + off.split('_')[1:]))
            ctrlName = cmds.rename(off.replace('OFF', 'CTRL'), '_'.join(off.split('_')[:1] + ['ik'] + off.split('_')[1:]).replace('OFF', 'CTRL'))

            offMetacarpsIK.append(offName)
            ctrlMetacarpsIK.append(ctrlName)

        shapes.shape_replace(childs=cmds.ls('CTRL_ik_metacarp_*' + side), shape='croissant', color=color, scale=[2*sceneScale, 2*sceneScale, 2*sceneScale])


        # add fk 

        if side == lside :
            color = 'darkBlue'
        if side == rside :
            color = 'darkOrange'

        controlers.ctrl_color('CTRL_metacarp_thumb' + side, color)

        handFKHierarchies = controlers.controler_hierarchy(names=[off.replace('OFF_ik', 'fk') for off in offMetacarpsIK], parent=dataGrpHand, cstrGroup=False, scale=2 * sceneScale, shape="keyY", color=color)

        for i in range(len(handFKHierarchies)):
            
            off = handFKHierarchies[i][0]
            reverseOff = handFKHierarchies[::-1][i][0]
            ikoff = offMetacarpsIK[i]
            cmds.matchTransform(off, ikoff)

            cmds.parent(off, 'CTRL_hand' + side)
            cmds.parent(ikoff, off.replace('OFF', 'CTRL'))

        
        fkmetacarps = cmds.ls('OFF_fk_metacarp_*' + side)[::-1]

        if len(fkmetacarps) >= 2:
            fkmetacarps[0], fkmetacarps[1] = fkmetacarps[1], fkmetacarps[0]

        for i in range(len(fkmetacarps)):
            off = fkmetacarps[i]

            if i < len(fkmetacarps)-1:
                nextCtrl = fkmetacarps[i+1].replace('OFF', 'CTRL')

                cmds.parent(off, nextCtrl)


        # matrix constraints on joints
        
        for i in range(len(handJnts)):

            jnt = handJnts[i]
            ctrl = handJnts[i].replace('SK', 'CTRL')

            if not cmds.objExists(ctrl):
                ctrl = handJnts[i].replace('SK', 'CTRL_ik')

            constraints.matrixConstraint(parent=ctrl, child=jnt)


        # master controler index

        if side == lside :
            color = 'lightBlue'
        if side == rside :
            color = 'lightOrange'

        fingers = ['thumb', 'index', 'middle', 'ring', 'pinky']

        for finger in fingers :
            
            fingersCtrl = cmds.ls(f'CTRL_{finger}_*{side}')
            masterCtrl = fingersCtrl[-2]
            indexCtrls = [fingersCtrl[-1]] + fingersCtrl[0:-2]
            indexCstr = controlers.add_cstr(controlers=indexCtrls)

            shapes.shape_replace(childs=[masterCtrl], shape='smoothSphere', color=color, scale=[sceneScale, sceneScale, sceneScale])
            
            for cstr in indexCstr:
                cmds.connectAttr(f'{masterCtrl}.rotate', f'{cstr}.rotate')


        # connect with arm

        cstr = controlers.add_cstr(['CTRL_hand' + side])[0]
        constraints.matrixConstraint(parent='CTRL_TW_lower_arm_03' + side, child=cstr, transforms=['translate'])
        orientCstr = cmds.orientConstraint('CTRL_fk_wrist' + side, 'CTRL_ik_wrist' + side, cstr, mo=1)[0]
        cmds.connectAttr('fcst_switch_fk_wrist' + side + '.outFloat', f'{orientCstr}.CTRL_fk_wrist{side}W0')
        cmds.connectAttr('rv_switch_fk_wrist' + side + '.outputX', f'{orientCstr}.CTRL_ik_wrist{side}W1')


        # change color CTRL_main
        controlers.ctrl_color(ctrl=f'CTRL_hand{side}', color=color)

def neck_build (*args):

    #---------------------------------------
    # neck
    #---------------------------------------

    spine.build( 
        templateChain=neckJnts,
        fkCtrls=['keyY', 'yellow', sceneScale/2],
        ikCtrls=['croissant', 'darkYellow', sceneScale/3.5],
        radius=sceneScale,
        doBendTwist=True,
        jntNumber=4,
        UVsMode=0,
        createEnd=False
        )

    for ctrlTW in cmds.ls('CTRL_fk_neck_*Shape'):
        shapes.rotate(ctrlTW, [180, 0, 90])
    
    shapes.shape_replace(childs=['CTRL_fk_neck_03_C'], shape='circle', color='yellow', scale=[11*sceneScale, 11*sceneScale, 11*sceneScale])
    
    cmds.hide('CTRL_ik_neck_03_C')

    # connect with neck

    hooks.create_hook('CTRL_fk_spine_04_C', 'OFF_fk_neck_01_C')

def head_build (*args):

    #---------------------------------------
    # head
    #---------------------------------------

    dataGrpHead = cmds.createNode('transform', n='GRP_build_head' + cside, ss=1)

    # joints
    
    tplHeadJnts = cmds.duplicate(headJnt, renameChildren=1)
    cmds.matchTransform(tplHeadJnts[0], headJnt)
    cmds.parent(tplHeadJnts[0], dataGrpHead)


    headJnts= []
    for jnt in tplHeadJnts:
        shortName = '_'.join(jnt.split('_')[1:-1])
        name = cmds.rename(jnt, 'SK_' + shortName + cside)

        headJnts.append(name)


    # controlers

    snName = '_'.join(headJnts[0].split('_')[1:])
    headHierarchies = controlers.controler_hierarchy(names=[snName], parent=dataGrpHead, cstrGroup=False, scale=9*sceneScale, shape="circle", color='yellow')
    cmds.matchTransform(headHierarchies[0][0], headJnts[0])

    # matrix constraint

    constraints.matrixConstraint(headHierarchies[0][-1], headJnts[0])


    # connect with neck

    c_attrs = 'CTRL_head_01'+ cside

    ctrlAttr_sn = c_attrs.split('_')[1::]
    ctrlAttr_sn = '_'.join(ctrlAttr_sn)

    separatorNeck = f'{ctrlAttr_sn}_sep_neck'
    followNeck = f'{ctrlAttr_sn}_follow_neck'
    
    cmds.addAttr(c_attrs,
                longName=separatorNeck,
                niceName='| NECK |',
                attributeType='enum',
                enumName='---------------',
                keyable=True)

    cmds.addAttr(c_attrs,
                longName=followNeck,
                niceName='Follow Neck',
                defaultValue=10,
                maxValue=10,
                minValue=0,
                keyable=True)

    facAttrFollowNeck = nodes.create_facAttr(parent=c_attrs, parentAttr=followNeck)

    cstr = controlers.add_cstr([f'CTRL_head_01{cside}'])[0]

    
    loc = cmds.spaceLocator(n=f'LOC_follow_neck_for_head')[0]
    cmds.matchTransform(loc, cstr)
    cmds.parent(loc, dataGrpHead)

    cmds.parentConstraint(f'CTRL_ik_neck_03{cside}', loc, mo=1)

    cmds.pointConstraint(f'H_SURF_for_SK_neck_04{cside}', cstr, mo=1)
    # orientCstr = cmds.orientConstraint(f'CTRL_ik_neck_03{cside}', cstr, mo=1)[0]
    # cmds.connectAttr(f'{facAttrFollowNeck}.output', f'{orientCstr}.CTRL_ik_neck_03{cside}W0')


    pairBlend = cmds.createNode('pairBlend', n=f'pb_follow_neck{cside}', ss=1)
    cmds.connectAttr(f'{facAttrFollowNeck}.output', f'{pairBlend}.weight')
    cmds.connectAttr(f'{loc}.r', f'{pairBlend}.inRotate2')
    cmds.connectAttr(f'{pairBlend}.outRotate', f'{cstr}.r')

def foot_build (*args):

    #---------------------------------------
    # foot
    #---------------------------------------

    for side in [lside, rside]:

        dataGrpFoot = cmds.createNode('transform', n='GRP_build_foot' + side, ss=1)


        # SK joints
        
        tplFootJnts = cmds.duplicate(footAnkleJnt + side, renameChildren=1)
        cmds.parent(tplFootJnts[0], dataGrpFoot)

        footJnts= []
        for jnt in tplFootJnts:
            shortName = '_'.join(jnt.split('_')[1:-1])
            name = cmds.rename(jnt, 'SK_' + shortName + side)

            footJnts.append(name)


        # controlers

        if side == lside :
            color = 'blue'
        if side == rside :
            color = 'orange'

        footJnts = footJnts[1:]

        snNames = ['_'.join(jnt.split('_')[1:]) for jnt in footJnts]

        footHierarchies = controlers.controler_hierarchy(names=snNames, parent=dataGrpFoot, cstrGroup=False, scale=5*sceneScale, shape="croissant", color=color)
  
        for i in range(len(footHierarchies)):

            hierarchy = footHierarchies[i]
            cmds.matchTransform(hierarchy[0], footJnts[i])

        cmds.parent(footHierarchies[1][0], footHierarchies[0][-1])

        
        # connect foot

        constraints.matrixConstraint('CTRL_toes_01'+side, 'SK_toes_01'+side)
        constraints.matrixConstraint('CTRL_toes_02'+side, 'SK_toes_02'+side)


        #---------------------------------------
        # Create foot setup (banking + spin)
        #---------------------------------------

        # joints

        jointsIK = joints.joint_hierarchy(names=['banking_outside', 'banking_inside', 'banking_heel', 'spin', 'banking_toes', 'height_toes', 'toes', 'foot_ankle'], prefix='JNT', ikfk='ik', parent=dataGrpFoot, side=side.split('_')[-1], radius=2.0, chain=True)

        for jnt, ref in zip(jointsIK, [f'TPL_banking_outside{side}', f'TPL_banking_inside{side}', f'TPL_banking_heel{side}', f'TPL_spin{side}', f'TPL_banking_toes{side}', f'TPL_height_toes{side}', f'TPL_toes{side}', f'TPL_foot_banking_ankle{side}']):
            
            cmds.matchTransform(jnt, ref)
            cmds.makeIdentity(jnt, apply=True, t=1, r=1, s=1, n=0) # freeze transform

        # attributes

        c_attrs = 'CTRL_ik_ankle'+side

        ctrlAttr_sn = c_attrs.split('_')[2::]
        ctrlAttr_sn = '_'.join(ctrlAttr_sn)

        separator = f'{ctrlAttr_sn}_sep_foot'
        footRoll = f'{ctrlAttr_sn}_foot_roll'
        bankingHeelToes = f'{ctrlAttr_sn}_banking_heel_toes'
        bankingSides = f'{ctrlAttr_sn}_banking_sides'
        editPivotSpin = f'{ctrlAttr_sn}_edit_pivot_spin'
        spin = f'{ctrlAttr_sn}_spin'
        separatorFootRoll = f'{ctrlAttr_sn}_sep_foot_roll'
        toesStep01 = f'{ctrlAttr_sn}_toes_step_01'
        toesStep02 = f'{ctrlAttr_sn}_toes_step_02'
        
        cmds.addAttr(c_attrs,
                    longName=separator,
                    niceName='| FOOT |',
                    attributeType='enum',
                    enumName='---------------',
                    keyable=True)

        cmds.addAttr(c_attrs,
                    longName=footRoll,
                    niceName='Foot Roll',
                    defaultValue=0,
                    maxValue=10,
                    minValue=0,
                    keyable=True)

        cmds.addAttr(c_attrs,
                    longName=bankingHeelToes,
                    niceName='Banking Front Back',
                    defaultValue=0,
                    maxValue=10,
                    minValue=-10,
                    keyable=True)

        cmds.addAttr(c_attrs,
                    longName=bankingSides,
                    niceName='Banking Sides',
                    defaultValue=0,
                    maxValue=10,
                    minValue=-10,
                    keyable=True)

        cmds.addAttr(c_attrs,
                    longName=editPivotSpin,
                    niceName='Edit Pivot Spin',
                    defaultValue=5,
                    maxValue=10,
                    minValue=0,
                    keyable=True)

        cmds.addAttr(c_attrs,
                    longName=spin,
                    niceName='Spin',
                    defaultValue=0,
                    maxValue=10,
                    minValue=-10,
                    keyable=True)

        cmds.addAttr(c_attrs,
                    longName=separatorFootRoll,
                    niceName='| FOOT ROLL |',
                    attributeType='enum',
                    enumName='---------------',
                    keyable=True)
                    
        cmds.addAttr(c_attrs,
                    longName = toesStep01,
                    niceName = 'Toes Step 01',
                    k = 1,
                    attributeType = 'float',
                    dv=15)
        
        cmds.addAttr(c_attrs,
                    longName = toesStep02,
                    niceName = 'Toes Step 02',
                    k = 1,
                    attributeType = 'float',
                    dv=10)

        #---------------------------------------
        # NODES
        #---------------------------------------

        initial_lengh = cmds.getAttr(f'{jointsIK[3]}.tz') + cmds.getAttr(f'{jointsIK[4]}.tz')

        # factAttr

        facAttr_FOOT_ROLL = nodes.create_facAttr(parent=c_attrs, parentAttr=footRoll, value=0.1)
        facAttr_BANKING_HEEL_TOES = nodes.create_facAttr(parent=c_attrs, parentAttr=bankingHeelToes, value=0.1)
        facAttr_BANKING_INSIDE_OUTSIDE = nodes.create_facAttr(parent=c_attrs, parentAttr=bankingSides, value=0.1)
        facAttr_EDIT_PIVOT_SPIN = nodes.create_facAttr(parent=c_attrs, parentAttr=editPivotSpin, value=0.1)
        facAttr_SPIN = nodes.create_facAttr(parent=c_attrs, parentAttr=spin, value=0.1)

        facAttr_angle_min_max = cmds.createNode('floatConstant', n='facAttr_for_ANGLE_MIN_MAX'+side, ss=1)
        cmds.setAttr(facAttr_angle_min_max+'.inFloat', 110) #ADAPTATIVE VALUE

        facAttr_foot_toes_1 = cmds.createNode('floatConstant', n='facAttr_for_TOES_STEP01'+side, ss=1)
        cmds.connectAttr(f'{c_attrs}.{toesStep01}', f'{facAttr_foot_toes_1}.inFloat')

        facAttr_foot_toes_2 = cmds.createNode('floatConstant', n='facAttr_for_TOES_STEP02'+side, ss=1)
        cmds.connectAttr(f'{c_attrs}.{toesStep02}', f'{facAttr_foot_toes_2}.inFloat')

        # FOOT ROLL

        rv_foot_roll = cmds.createNode('remapValue', n='rv_ik_foot_roll_toes'+side, ss=1)

        cmds.connectAttr(facAttr_FOOT_ROLL+'.output', rv_foot_roll+'.inputValue')
        cmds.connectAttr(rv_foot_roll+'.outValue', 'JNT_ik_toes'+side+'.rotateX')

        cmds.setAttr(rv_foot_roll+'.value[1].value_Position', 0.5)
        cmds.setAttr(rv_foot_roll+'.value[2].value_Position', 1)

        cmds.connectAttr(facAttr_foot_toes_1+'.outFloat', rv_foot_roll+'.value[1].value_FloatValue')
        cmds.connectAttr(facAttr_foot_toes_2+'.outFloat', rv_foot_roll+'.value[2].value_FloatValue')


        rv_foot_roll_banking = cmds.createNode('remapValue', n='rv_ik_foot_roll_banking_toes'+side, ss=1)

        cmds.connectAttr(facAttr_FOOT_ROLL+'.output', rv_foot_roll_banking+'.inputValue')
        cmds.connectAttr(facAttr_foot_toes_1+'.outFloat', rv_foot_roll_banking+'.outputMax')

        cmds.setAttr(rv_foot_roll_banking+'.inputMin', 0.5)


        add_IK_banking = cmds.createNode('addDoubleLinear', n='add_ik_foot_banking_toes'+side, ss=1)

        cmds.connectAttr(rv_foot_roll_banking+'.outValue', add_IK_banking+'.input2')
        cmds.connectAttr(add_IK_banking+'.output', 'JNT_ik_banking_toes'+side+'.rotateX')

        # BANKING HEEL TOES

        rv_foot_banking_toes = cmds.createNode('remapValue', n='rv_ik_foot_banking_toes'+side, ss=1)

        cmds.connectAttr(facAttr_BANKING_HEEL_TOES+'.output', rv_foot_banking_toes+'.inputValue')
        cmds.connectAttr(rv_foot_banking_toes+'.outValue', add_IK_banking+'.input1')
        cmds.connectAttr(facAttr_angle_min_max+'.outFloat', rv_foot_banking_toes+'.outputMax')


        rv_foot_banking_heel = cmds.createNode('remapValue', n='rv_ik_foot_banking_heel'+side, ss=1)

        cmds.connectAttr(facAttr_BANKING_HEEL_TOES+'.output', rv_foot_banking_heel+'.inputValue')
        cmds.connectAttr(facAttr_angle_min_max+'.outFloat', rv_foot_banking_heel+'.outputMax')
        cmds.connectAttr(rv_foot_banking_heel+'.outValue', 'JNT_ik_banking_heel'+side+'.rotateX')

        cmds.setAttr(rv_foot_banking_heel+'.inputMin', -1)
        cmds.setAttr(rv_foot_banking_heel+'.inputMax', 0)
        cmds.setAttr(rv_foot_banking_heel+'.value[0].value_FloatValue', 1)
        cmds.setAttr(rv_foot_banking_heel+'.value[1].value_FloatValue', 0)

        # BANKING INSIDE OUTSIDE

        rv_banking_inside = cmds.createNode('remapValue', n='rv_ik_foot_banking_inside'+side, ss=1)

        cmds.connectAttr(facAttr_BANKING_INSIDE_OUTSIDE+'.output', rv_banking_inside+'.inputValue')
        cmds.connectAttr(rv_banking_inside+'.outValue', 'JNT_ik_banking_inside'+side+'.rotateX')
        cmds.connectAttr(facAttr_angle_min_max+'.outFloat', rv_banking_inside+'.outputMax')

        cmds.setAttr(rv_banking_inside+'.inputMin', -1)
        cmds.setAttr(rv_banking_inside+'.inputMax', 0)
        cmds.setAttr(rv_banking_inside+'.value[0].value_FloatValue', 1)
        cmds.setAttr(rv_banking_inside+'.value[1].value_FloatValue', 0)


        rv_banking_outside = cmds.createNode('remapValue', n='rv_ik_foot_banking_outside'+side, ss=1)

        cmds.connectAttr(facAttr_BANKING_INSIDE_OUTSIDE+'.output', rv_banking_outside+'.inputValue')
        cmds.connectAttr(rv_banking_outside+'.outValue', 'JNT_ik_banking_outside'+side+'.rotateX')
        cmds.connectAttr(facAttr_angle_min_max+'.outFloat', rv_banking_outside+'.outputMax')

        # EDIT SPIN

        rv_edit_pivot_spin = cmds.createNode('remapValue', n='rv_ik_foot_edit_pivot_spin'+side, ss=1)

        cmds.connectAttr(facAttr_EDIT_PIVOT_SPIN+'.output', rv_edit_pivot_spin+'.inputValue')
        cmds.connectAttr(rv_edit_pivot_spin+'.outValue', 'JNT_ik_spin'+side+'.translateZ')


        fc_initial_lengh = cmds.createNode('floatConstant', n='fc_initial_lengh_foot_ik'+side, ss=1)

        cmds.setAttr(fc_initial_lengh+'.inFloat', initial_lengh)   # ADJUST THE VALUE
        cmds.connectAttr(fc_initial_lengh+'.outFloat', rv_edit_pivot_spin+'.outputMax')


        fm_sub_banking_toes = cmds.createNode('floatMath', n='sub_ik_foot_banking_toes'+side, ss=1)

        cmds.connectAttr(fc_initial_lengh+'.outFloat', fm_sub_banking_toes+'.floatA')
        cmds.connectAttr(rv_edit_pivot_spin+'.outValue', fm_sub_banking_toes+'.floatB')
        cmds.connectAttr(fm_sub_banking_toes+'.outFloat', 'JNT_ik_banking_toes'+side+'.translateZ')

        cmds.setAttr(fm_sub_banking_toes+'.operation', 1)

        # SPIN

        rv_spin = cmds.createNode('remapValue', n='rv_ik_foot_spin'+side, ss=1)

        cmds.connectAttr(facAttr_SPIN+'.output', rv_spin+'.inputValue')
        cmds.connectAttr(facAttr_angle_min_max+'.outFloat', rv_spin+'.outputMax')
        cmds.connectAttr(rv_spin+'.outValue', 'JNT_ik_spin'+side+'.rotateX')

        cmds.setAttr(rv_spin+'.inputMin', -1)


        fm_inv_angle_min_max = cmds.createNode('floatMath', n='inv_foot_for_angle_min_max'+side, ss=1)

        cmds.connectAttr(facAttr_angle_min_max+'.outFloat', fm_inv_angle_min_max+'.floatA')
        cmds.connectAttr(fm_inv_angle_min_max+'.outFloat', rv_spin+'.outputMin')

        cmds.setAttr(fm_inv_angle_min_max+'.floatB', -1)
        cmds.setAttr(fm_inv_angle_min_max+'.operation', 2)


        # Connect with leg

        # connect ctrl IK and FK to the first GRP_JNT_ik
        group = cmds.createNode('transform', n=f'GRP_JNT_ik_foot{side}', ss=1)
        cmds.matchTransform(group, f'JNT_ik_banking_outside{side}')
        cmds.parent(group, 'H_JNTS_main')
        cmds.parent(f'JNT_ik_banking_outside{side}', group)

        locIKFK = []
        for switch in ['ik', 'fk']:
            loc = cmds.spaceLocator(n=f'LOC_{switch}_foot_ankle{side}')[0]
            cmds.parent(loc, dataGrpFoot)
            cmds.matchTransform(loc, f'SK_foot_ankle{side}')
            hooks.create_hook(f'CTRL_{switch}_ankle{side}', loc)

            locIKFK.append(loc)

        cstr = controlers.add_cstr([f'CTRL_toes_01{side}'])[0]

        parentCstr = cmds.parentConstraint(locIKFK[1], locIKFK[0], group, mo=1)[0]
        cmds.connectAttr('fcst_switch_fk_ankle' + side + '.outFloat', f'{parentCstr}.{locIKFK[1]}W0')
        cmds.connectAttr('rv_switch_fk_ankle' + side + '.outputX', f'{parentCstr}.{locIKFK[0]}W1')


        # delete existing hook on IKHD_leg
        # IKHD hooked with the last JNT_ik
        cmds.parent(f'IKHD_JNT_ik_femur{side}', f'GRP_CTRL_ik_leg{side}')
        cmds.delete(f'H_IKHD_JNT_ik_femur{side}_from_CTRL_ik_ankle{side}')
        hooks.create_hook(f'JNT_ik_foot_ankle{side}', f'IKHD_JNT_ik_femur{side}')


        # switch IK FK parentCstr for CSTR_toes_01 parentCstr
        locFK = cmds.spaceLocator(n=f'LOC_{switch}_toes_01{side}')[0]
        cmds.parent(locFK, dataGrpFoot)
        cmds.matchTransform(locFK, f'JNT_ik_height_toes{side}')
        hooks.create_hook(f'CTRL_fk_ankle{side}', locFK, f'_for_toes_01{side}')

        parentCstr = cmds.parentConstraint(f'JNT_ik_height_toes{side}', locFK, cstr, mo=1)[0]
        cmds.connectAttr('rv_switch_fk_ankle' + side + '.outputX', f'{parentCstr}.JNT_ik_height_toes{side}W0')
        cmds.connectAttr('fcst_switch_fk_ankle' + side + '.outFloat', f'{parentCstr}.{locFK}W1')
        cmds.setAttr(f'{parentCstr}.interpType', 2)


        # IKHD and LOC_fk pointCstr the first SK_
        pointCstr = cmds.pointConstraint(locIKFK[1], f'IKHD_JNT_ik_femur{side}', f'SK_foot_ankle{side}', mo=1)[0]
        cmds.connectAttr('fcst_switch_fk_ankle' + side + '.outFloat', f'{pointCstr}.{locIKFK[1]}W0')
        cmds.connectAttr('rv_switch_fk_ankle' + side + '.outputX', f'{pointCstr}.IKHD_JNT_ik_femur{side}W1')


        cmds.orientConstraint(f'JNT_ik_foot_ankle{side}', f'SK_foot_ankle{side}', mo=1)

def data_groups (*args):

    #---------------------------------------
    # ORGANISE DATA GROUPS
    #---------------------------------------

    cmds.delete('H_SURFACES_main')


    dataGrps = cmds.ls('GRP_build_*')

    for data in dataGrps:
        childs = cmds.listRelatives(data, c=1)


        for child in childs:
            
            if child.startswith('GRP_CTRL_') or child.startswith('OFF_') or child.startswith('H_'):
                cmds.parent(child, 'H_ctrls_main')

                if child.startswith('GRP_CTRL_'):
                    childrens = cmds.listRelatives(child, c=1)

                    for node in childrens :

                        if node.startswith('JNT_') :
                            cmds.parent(node, 'H_JNTS_main')

                        if node.startswith('H_'):
                            
                            children1 = cmds.listRelatives(node, c=1)[0]
                            
                            if children1.startswith('LOC_'):
                                cmds.parent(node, 'H_LOCS_main')

                            if children1.startswith('IKHD_'):
                                cmds.parent(node, 'H_JNTS_main')

                if child.startswith('H_'):
                    children = cmds.listRelatives(child, c=1)[0]

                    if children.startswith('LOC_'):
                        cmds.parent(child, 'H_LOCS_main')

            elif child.startswith('SK_') or child.startswith('GRP_H_SURF_'):
                cmds.parent(child, 'H_SKS_main')

            elif child.startswith('GRP_SKsurf_') or child.startswith('JNT_'):
                cmds.parent(child, 'H_JNTS_main')

            elif child.startswith('LOC_'):
                cmds.parent(child, 'H_LOCS_main')

            elif child.startswith('GRP_SURF_'):
                cmds.parent(child, 'SURFACES')

            elif child.startswith('disDim_'):
                cmds.parent(child, 'H_DEFORMERS_main')


        cmds.delete(data)

def load_ctrlShape (path = r'\\Storage01\3d4\seaOfLeaves\04_asset\character\captain\maya\scenes\edit\rig\utils\shapes\captain_ctrlShapes.json'):

    exclude = []

    allControlers = cmds.ls('CTRL_*_L', 'CTRL_*_R', 'CTRL_*_C')
    controlers = [controler for controler in allControlers if controler not in exclude]

    # LOAD SHAPES
    rigit.v2_0.tools.saveCvPositions.load(
    path,
    objects = controlers, 
    loadColor = False, 
    verbose = True)

def cleaning (*args):

    # lock and hide attrs
    for ctrl in cmds.ls('CTRL_attr_*_L') + cmds.ls('CTRL_attr_*_R'):
        
        attrs = ['t', 'r', 's']
        axis = ['x', 'y', 'z']
        for attr in attrs:
            
            for ax in axis :
                cmds.setAttr(f'{ctrl}.{attr}{ax}', lock=1, k=0)

        cmds.setAttr(f'{ctrl}.visibility', lock=1, k=0)

def hide_rman_attrs (*args):

    nodes = cmds.ls(dag=1, defaultNodes=0)

    for node in nodes:
        rman_attrs = [attr for attr in cmds.listAttr(node, fromPlugin=1) if attr.startswith('rman_')]

        for attr in rman_attrs:
            try:
                mel.eval('setAttr -keyable false -channelBox false "{}.{}"'.format(node, attr))

            except:
                pass