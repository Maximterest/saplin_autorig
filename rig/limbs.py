import maya.cmds as cmds


from .. import template
from .. import nomenclature

from ..utils import joints
from ..utils import controlers
from ..utils import surfaces
from ..utils import hooks
from ..utils import nodes

from ..tools import hierarchies

from ..rigbase import ik_fk
from ..rigbase import ribbons


def build ( 
            templateChain=[],
            fkCtrls=['circle', 'blue', 1.0],
            ikCtrls=['flattenCube', 'red', 1.0],
            attrCtrl=['cross', 'pink', 1.0],
            ikType='rotate_plane',
            splineCurve='',
            doWorldAlignedEnd=False,
            addAutoStretch=True,
            snapPV=True,
            radius=1.0,
            doBendTwist=True,
            twCtrls=[3, 'circle', 'lightBlue', 1.0],
            jntNumber=5
            ):

    """
    @param templateChain = list, template joints
    @param fkCtrls = list, [shape = str, color = str, scale = float]
    @param ikCtrls = list, [shape = str, color = str, scale = float]
    @param attrCtrls = list, [shape = str, color = str, scale = float]
    @param ikType = str, ikHandle type: 'rotate_plane', 'single_chain', 'spline'
    @param splineCurve = str, works only in ikType='spline', specify the curve where to create the IK spine
    @param doWorldAlignedEnd = bool, last ik controler oriented to the world or not
    @param addAutoStretch = bool, create auto stretch limb or not
    @param radius = float, specify joints radius
    @param doBendTwist = bool, create ribbon on limb or not
    @param twCtrls = list, [number = int, shape = str, color = str, scale = float]
    @param jntNumber = int, number of joint on the ribbon
    
    @return str: dataGroup, parent group of all the limb creation
    """


    factorIK = 16
    factorFK = 9
    factorATTR = 11

    prefix_dataGroup = nomenclature.prefix['dataGroup']
    prefix_group = nomenclature.prefix['group']
    prefix_surface = nomenclature.prefix['surface']
    prefix_controler = nomenclature.prefix['controler']
    prefix_locator = nomenclature.prefix['locator']
    prefix_distanceDimension = nomenclature.prefix['distanceDimension']
    prefix_multiplyDivide = nomenclature.prefix['multiplyDivide']
    prefix_blendColor = nomenclature.prefix['blendColor']
    prefix_decomposeMatrix = nomenclature.prefix['decomposeMatrix']
    prefix_floatMath = nomenclature.prefix['floatMath']
    
    
    side =  templateChain[0].split('_')[-1]
    limb = cmds.listRelatives(templateChain[0], p=1)[0].split('_')[-2]
    

    # create data group
    dataGroup = cmds.createNode('transform', n=f'{prefix_dataGroup}_limb_{limb}_{side}', ss=1)


    #===============================================================================
    # SK joints
    #===============================================================================
    
    sk_joints = joints.create_sk_chain(
        refChain=templateChain,
        parent=dataGroup,
        radius=radius
        )


    #===============================================================================
    # FK
    #===============================================================================

    grpCtrlFk = cmds.createNode('transform', n=f'{prefix_group}_{prefix_controler}_fk_{limb}_{side}', p=dataGroup, ss=1)

    # hierarchy
    hierarchies.fk_hierarchy(
        refChain=sk_joints,
        parent=grpCtrlFk,
        radius=radius,
        scale=fkCtrls[2] * factorFK,
        shape=fkCtrls[0], 
        color=fkCtrls[1], 
        cstrGroup=False
        )


    #===============================================================================
    # IK
    #===============================================================================

    grpCtrlIk = cmds.createNode('transform', n=f'{prefix_group}_{prefix_controler}_ik_{limb}_{side}', p=dataGroup, ss=1)

    # hierarchy
    IK_hierarchies = hierarchies.ik_hierarchy(
        refChain=sk_joints,
        limb=limb,
        parent=grpCtrlIk,
        ikType=ikType,
        splineCurve=splineCurve,
        pvLoc=f'LOC_pv_{limb}_{side}',
        radius=radius,
        scale=ikCtrls[2] * factorIK,  
        shape=ikCtrls[0],
        color=ikCtrls[1],
        cstrGroup=False,
        doWorldAlignedEnd=doWorldAlignedEnd
        )
    
    # switch ik / fk
    ctrlAttr = controlers.controler_hierarchy(
        names=[f'attr_{limb}_{side}'], 
        parent=dataGroup,
        cstrGroup=False,
        scale=attrCtrl[2] * factorATTR,
        shape=attrCtrl[0],
        color=attrCtrl[1])[0]

    cmds.matchTransform(ctrlAttr[0], IK_hierarchies[-1][-1][0], pos=1)

    ik_fk.switch_ik_fk(
        nodeList=sk_joints,
        ctrlAttr=ctrlAttr[-1],
        autoHideGroups=[grpCtrlFk, grpCtrlIk]
        )
    
    # auto stretch ik
    if addAutoStretch :
        ik_fk.auto_stretch_ik(
            joints=sk_joints,
            ctrlAttr=ctrlAttr[-1],
            parent=dataGroup
            )


    #===============================================================================
    # Twists and Bend
    #===============================================================================

    if doBendTwist :

        grpSurfaces = cmds.createNode('transform', n=f'{prefix_group}_{prefix_surface}_{limb}_{side}', p=dataGroup, ss=1)

        # create surfaces

        created_surfaces = []

        for i in range(len(templateChain)-1):
            
            templateJoint = templateChain[i]
            
            if i < len(templateChain)-1:
                nextTemplateJoint = templateChain[i+1]

            if i == 0 :
                name = f'{prefix_surface}_upper_{limb}_{side}'

            elif i > 0 and i < len(templateChain)-1:
                name = f'{prefix_surface}_mid_0{i}_{limb}_{side}'
                if i > 9 :
                    name = f'{prefix_surface}_mid_{i}_{limb}_{side}'

            if i == len(templateChain)-2 :
                name = f'{prefix_surface}_lower_{limb}_{side}'


            surf = surfaces.create_loft_surface(name=name, points=[templateJoint, nextTemplateJoint], widthSize=radius*7, spansNumber=0, parent=grpSurfaces)

            created_surfaces.append(surf)
        
        
        # create ribbons
        all_hierarchies = []

        for surface in created_surfaces :
            
            ribbon_hierarchies = ribbons.create_ribbon_on_surface(surface=surface, jntNumber=jntNumber, UVsMode=0, parent=dataGroup, ctrls=[twCtrls[0], twCtrls[1], twCtrls[2], twCtrls[3]], radius=radius, cstrGroup=True)
            
            # connect ribbons
            
            cmds.pointConstraint(ribbon_hierarchies[0][-1], ribbon_hierarchies[-1][-1], ribbon_hierarchies[1][-2], mo=1)
            cmds.aimConstraint(ribbon_hierarchies[-1][-1], ribbon_hierarchies[1][-2], aim=[0, 0, 1], u=[0, 1, 0], wu=[0, 1, 0], wut='objectrotation', wuo=ribbon_hierarchies[0][-2])

            all_hierarchies.append(ribbon_hierarchies)

        for i in range(len(templateChain)-1) :

            hierarchy = all_hierarchies[i]

            next_hierarchy = ''
            if i < len(templateChain)-2:
                next_hierarchy = all_hierarchies[i+1]

                cmds.hide(hierarchy[-1][0])

            joint = sk_joints[i]

            cmds.parentConstraint(joint, hierarchy[0][-2], mo=1)
            if next_hierarchy :
                cmds.parentConstraint(next_hierarchy[0][-1], hierarchy[-1][-2], mo=1)

        cmds.parentConstraint(sk_joints[-1], all_hierarchies[-1][-1][-2], mo=1)
        

    #===============================================================================
    # Snape pole vector
    #===============================================================================

    if snapPV == True:

        if cmds.objExists('CTRL_WALK'):

            # create distance tool

            ctrlPV = IK_hierarchies[-1][1][-1]

            posCtrlPV = cmds.xform(ctrlPV, query=1, worldSpace=1, translation=1)
            locPV = cmds.spaceLocator(n= f'{prefix_locator}_{prefix_distanceDimension}_to_{ctrlPV}', p=posCtrlPV)
            cmds.parent(locPV, dataGroup)
                
            pos1 = cmds.xform(IK_hierarchies[0][0][0], query=1, worldSpace=1, translation=1)
            name1 = f'{prefix_distanceDimension}_{IK_hierarchies[0][0][0]}_to_{ctrlPV}'

            distanceTool1 = cmds.distanceDimension(startPoint=pos1, endPoint=posCtrlPV)
            cmds.parent(distanceTool1, dataGroup)
            cmds.rename(cmds.listRelatives(distanceTool1, parent=1), name1)


            pos2 = cmds.xform(IK_hierarchies[0][0][-1], query=1, worldSpace=1, translation=1)
            name2 = f'{prefix_distanceDimension}_{ctrlPV}_to_{IK_hierarchies[0][0][-1]}'

            distanceTool2 = cmds.distanceDimension(startPoint=posCtrlPV, endPoint=pos2)
            cmds.parent(distanceTool2, dataGroup)
            cmds.rename(cmds.listRelatives(distanceTool2, parent=1), name2)

            hooks.create_hook(ctrlPV, locPV)

            # attributes

            ctrlAttr_sn = ctrlPV.split('_')[2::]
            ctrlAttr_sn = '_'.join(ctrlAttr_sn)

            separator = f'{ctrlAttr_sn}_sep_snapPV'
            snapPV_name = f'{ctrlAttr_sn}_snapPV'

            cmds.addAttr(ctrlPV,
                    longName=separator,
                    niceName='| IK |',
                    attributeType='enum',
                    enumName='---------------',
                    keyable=True)

            cmds.addAttr(ctrlPV,
                        longName=snapPV_name,
                        niceName='Snap',
                        defaultValue=0,
                        maxValue=10,
                        minValue=0,
                        keyable=True)

            # nodal

            factorAttrSnapPV = nodes.create_facAttr(parent=ctrlPV, parentAttr=snapPV_name, value=0.1)
            
            decomposeMatrix_name = f'{prefix_decomposeMatrix}_{ctrlAttr_sn}'
            cmds.createNode('decomposeMatrix', n=decomposeMatrix_name, ss=1)

            cmds.connectAttr('CTRL_WALK.worldMatrix[0]', f'{decomposeMatrix_name}.inputMatrix')



            for disDim in [name1, name2]:
                
                    multiplyDivide_name = f'{prefix_multiplyDivide}_{disDim}'
                    cmds.createNode('multiplyDivide', n=multiplyDivide_name, ss=1)


                    blendColor_name = f'{prefix_blendColor}_{disDim}'
                    cmds.createNode('blendColors', n=blendColor_name, ss=1)
                    
                    # side R
                    if side == nomenclature.suffix['right']:

                        floatMath_name = f'{prefix_floatMath}_{disDim}'
                        cmds.createNode('floatMath', n=floatMath_name, ss=1)

                        cmds.setAttr(f'{floatMath_name}.operation', 2)
                        cmds.setAttr(f'{floatMath_name}.floatB', -1)

                        cmds.connectAttr(f'{disDim}.distance', f'{floatMath_name}.floatA')
                        cmds.connectAttr(f'{floatMath_name}.outFloat', f'{multiplyDivide_name}.input1X')

                    else : 
                        cmds.connectAttr(f'{disDim}.distance', f'{multiplyDivide_name}.input1X')

                    # decompose Matrix
                    cmds.connectAttr(f'{decomposeMatrix_name}.outputScale', f'{multiplyDivide_name}.input2')

                    # multiplyDivide_name
                    cmds.connectAttr(f'{multiplyDivide_name}.output', f'{blendColor_name}.color1')

                    cmds.setAttr(f'{multiplyDivide_name}.operation', 2)

                    #blendColor
                    cmds.connectAttr(f'{factorAttrSnapPV}.output', f'{blendColor_name}.blender')


                    IKjoint = None

                    if disDim == name1 :
                        IKjoint = IK_hierarchies[0][0][1]

                    if disDim == name2 :
                        IKjoint = IK_hierarchies[0][0][-1]

                    jointValue = cmds.getAttr(f'{IKjoint}.tz')
                    cmds.setAttr(f'{blendColor_name}.color2R', jointValue)

                    cmds.connectAttr(f'{blendColor_name}.outputR', f'{IKjoint}.tz')


    return dataGroup