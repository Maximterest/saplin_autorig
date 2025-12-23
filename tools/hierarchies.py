import maya.cmds as cmds

from .. import nomenclature

from ..utils import attributes
from ..utils import controlers
from ..utils import joints
from ..utils import shapes
from ..utils import hooks
from ..utils import constraints


def fk_hierarchy (refChain=[], parent='', radius=1.0, scale=1.0, shape='circle', color='lightBlue', cstrGroup=False):

    """
    @param refChain = list, reference joints on which you want to create the hierarchy
    @param parent = str, node under which you whan to parent the created offsets
    @param radius = float, joints radius
    @param scale = float, controlers scale
    @param shape = str, controlers shape
    @param color = str, controlers color
    @param cstrGroup = bool, whether or not you want the hierarchies to have a constraint group

    @return list [list: fk joints, list: controlers hierarchies]

    DO: creates an fk controlers and joints chain from a reference joint chain
    """


    prefix_joint = nomenclature.prefix['joint']


    # create joints

    fk_joints = joints.create_fk_chain (refChain=refChain, parent=parent, radius=radius)


    # create controlers

    names = [joint.split(f'{prefix_joint}_')[-1] for joint in fk_joints]


    all_hierarchies = controlers.controler_hierarchy(names=names, parent=parent, shape=shape, scale=scale, color=color, cstrGroup=cstrGroup)

    for i in range(len(fk_joints)):
        jnt = fk_joints[i]
        hierarchy = all_hierarchies[i]
        off = hierarchy[0]
        ctrl = hierarchy[-1]

        cmds.matchTransform(off, jnt)
        constraints.matrixConstraint(ctrl, jnt)

        if i < len(fk_joints)-1:
            cmds.parent(all_hierarchies[i+1][0], ctrl)

    return fk_joints, all_hierarchies

def ik_hierarchy (refChain=[], limb='', parent='', ikType='rotate_plane', splineCurve='', pvLoc='', radius=1.0, scale=1.0, shape='circle', color='red', cstrGroup=False, doWorldAlignedEnd=False):

    """
    @param refChain = list, give the joint chain reference
    @param limb = str, limb name for the name of the poleVector (ex: leg/arm...)
    @param parent = str, parent group for all the creation
    @param ikType = str, ikHandle type: 'rotate_plane', 'single_chain', 'spline'
    @param splineCurve = str, works only in ikType='spline', specify the curve where to create the IK spine
    @param pvLoc = str, locator reference for the creation of the pole vector
    @param radius = float, specify joints radius
    @param scale = float, controlers scale
    @param shape = str, contolers shape
    @param color = str, controlers color
    @param cstrGroup = bool, create CSTR groups under offset groups or not
    
    @return list [list: [ik joints], list: controlers hierarchies]
    """


    prefix_joint = nomenclature.prefix['joint']


    # create joints
    
    ik_chain = joints.create_ik_chain(refChain=refChain, parent=parent, ikType=ikType, splineCurve=splineCurve, radius=radius)

    ik_joints = ik_chain[0]
    ikHandle = ik_chain[1]
    jnt_pv_chain = [ik_joints[0], pvLoc, ik_joints[-1]]
    

    # create controlers

    firstCTRL = ik_joints[0].split(f'{prefix_joint}_')[-1] # remove jnt prefix
    lastCTRL = ik_joints[-1].split(f'{prefix_joint}_')[-1] # remove jnt prefix
    pvCTRL = f'pv_{limb}_' + ik_joints[0].split('_')[-1] # + side

    names = [firstCTRL, pvCTRL, lastCTRL]

    all_hierarchies = controlers.controler_hierarchy(names=names, parent=parent, shape=shape, scale=scale, color=color, cstrGroup=cstrGroup)

    for i in range(3):
        matchTo = jnt_pv_chain[i]
        hierarchy = all_hierarchies[i]
        off = hierarchy[0]

        cmds.matchTransform(off, matchTo)
    
    shapes.shape_replace(childs=[all_hierarchies[1][-1]], shape='smoothSphere', color=color, scale=[scale/3, scale/3, scale/3]) # apply sphere shape on pole vector ctrl
    
    if doWorldAlignedEnd :
        off_lastCtrl = all_hierarchies[-1][0]

        baseValue = cmds.getAttr(off_lastCtrl+'.rx')
        # if baseValue > 0 :
        #     newValue = 90
        # if baseValue < 0 :
        #     newValue = -90

        newValue = 0
        
        cmds.setAttr(off_lastCtrl+'.rx', newValue)
        cmds.setAttr(off_lastCtrl+'.rz', 0)

    # constraint controlers with joints
    constraints.matrixConstraint(all_hierarchies[0][-1], ik_joints[0]) # first ctrl to first jnt
    hooks.create_hook(all_hierarchies[-1][-1], ikHandle, f'_{ikHandle}')
    cmds.poleVectorConstraint(all_hierarchies[1][-1], ikHandle) # middle ctrl to ikHandle


    return ik_chain, all_hierarchies

def hybrid_hierarchy(refChain=[], ctrlFk=['circle', 'lightBlue', 1.0], ctrlIk=['circle', 'red', 1.0], radius=1.0, cstrGroup=False, parent='', doJoint=True, hybrid_joints=[]):
    
    """
    @param refChain = list, joints on which you want the hybrid hierarchy to perform
    @param ctrlFk = list, [shape = str, color = str, scale = float]
    @param ctrlIk = list, [shape = str, color = str, scale = float]
    @param cstrGroup = bool, wether the controlers should have a cstrGoup
    @param parent = str, group where to parent all the creation
    @param doJoint = bool, create joints connected to ctrls or not
    @param hybrid_joints = list, only if doJoint = False: give the list of joint where you want to create the hybrid ctrls hierarchy
    
    @return list [list: hybrid joints, list: controlers hierarchies]

    DO :
    create hybrid hierarchy on the specified joints
    """

    prefix_joint = nomenclature.prefix['joint']


    if doJoint :

        # create joint
        side = refChain[0].split('_')[-1]
        jntChain = ['_'.join(jnt.split('_')[1:-1]) for jnt in refChain]

        hybrid_joints = joints.joint_hierarchy(names=jntChain, prefix=prefix_joint, ikfk='ikfk', parent=parent, side=side, radius=radius)

        # move jntChain on refChain
        for i in range(len(refChain)):

            baseJnt = refChain[i]
            jnt = hybrid_joints[i]

            cmds.matchTransform(jnt, baseJnt)
            cmds.makeIdentity(jnt, apply=1, r=1)


    # create controlers

    all_hierarchies = []

    for method in ['fk', 'ik']:
        
        if doJoint :
            names = [method + joint.split(f'{prefix_joint}_ikfk')[-1] for joint in hybrid_joints]
        
        else :
            names = [method + '_' + '_'.join(joint.split('_')[1:]) for joint in hybrid_joints]

        if method == 'fk' :
            shape = ctrlFk[0]
            color = ctrlFk[1]
            scale = ctrlFk[2]

        if method == 'ik' :
            shape = ctrlIk[0]
            color = ctrlIk[1]
            scale = ctrlIk[2]

        hierarchies = controlers.controler_hierarchy(names=names, shape=shape, scale=scale, color=color, cstrGroup=cstrGroup, parent=parent)

        for i in range(len(hybrid_joints)):

            jnt = hybrid_joints[i]
            hierarchy = hierarchies[i]
            off = hierarchy[0]
            ctrl = hierarchy[-1]

            cmds.matchTransform(off, jnt)

            if method == 'fk':
                if i < len(hybrid_joints)-1:
                    cmds.parent(hierarchies[i+1][0], ctrl)

            if method == 'ik':
                off = hierarchies[i][0]
                ctrlIk = hierarchies[i][-1]
                ctrlFk = all_hierarchies[i][-1]

                cmds.parent(off, ctrlFk)

                constraints.matrixConstraint(ctrlIk, jnt)


            all_hierarchies.append(hierarchy)


    return hybrid_joints, all_hierarchies