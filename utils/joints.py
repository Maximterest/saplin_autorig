import maya.cmds as cmds

from .. import nomenclature

from ..utils import hooks


def joint_hierarchy(names=[], prefix='', ikfk='', parent='', side='', radius=1.0, chain=True): 

    """
    @param names = list, give the limb parts names (ex: ['femur', 'knee', 'ankle'])
    @param prefix = str, prefix based on the nomenclature.py
    @param ikfk = str, valid args are: 'ik', 'fk', 'ikfk' (added in joints names)
    @param parent = str, parent node for the hiearchy
    @param side = str, based on the nomenclature.py
    @param mainAxis = str, choose the main axis for all joints
    @param radius = int, radius value

    @return list: joint hierarchy names
    """


    joint_hierarchy = []

    if ikfk == 'ik':
        ikfk = 'ik_'
    elif ikfk == 'fk':
        ikfk = 'fk_'
    elif ikfk == 'ikfk':
        ikfk = 'ikfk_'
    else :
        ikfk = ''

    if parent :
        cmds.select(parent)
    else :
        cmds.select(deselect=1)

    for name in names :
        
        if prefix : base_name = f'{prefix}_{ikfk}{name}'
        else : base_name = f'{ikfk}{name}'
        if side : jnt_name = f'{base_name}_{side}'
        else : jnt_name = base_name
        
        cmds.joint(n=jnt_name, rad=radius)

        if chain == False:
            cmds.select(d=1)
            if parent :
                cmds.select(parent)

        joint_hierarchy.append(jnt_name)

    cmds.select(deselect=1)


    return joint_hierarchy

def ik_rotate_plane_handle (startJoint = '', 
                            endEffector = '', 
                            autoPriority = False, 
                            snapEnable = True, 
                            priority = 1,
                            weight = 1.0,
                            POWeight = 1.0, 
                            parent = ''):

    """
    @param startJoint = str, first joint of the ik 
    @param endEffector = str, last joint of the ik 
    @param parent = str, group under which you want to parent the created ik handle
    @param autoPriority = bool, specifies that this handle's priority is assigned automatically
    @param snapEnable = bool, if the handle is snapped to the end effector 
    @param sticky = str, specifies that this handle is "sticky". Valid values are "off", "sticky", "superSticky"
    @param priority = int, sets priority of the handle
    @param weight = float, specifies the handles weight in error calculations
    @param POWeight = float, specifies the position/orientation weight of a handle
    

    @return: list: ik_handle ([ik_handle_name, effector])

    DO :
    create ik rotate plane on ik joint chain
    """


    prefix = nomenclature.prefix['ikHandle']
    lower_name = startJoint
    handle_name = f'{prefix}_{lower_name}'
 
    ik_handle = cmds.ikHandle(n = handle_name, 
                              sol = "ikRPsolver",
                              sj = startJoint, 
                              ee = endEffector,
                              ap = autoPriority,
                              p = priority,
                              w = weight, 
                              pw = POWeight)
    cmds.setAttr(f'{handle_name}.snapEnable', snapEnable)

    if parent:
        cmds.parent(ik_handle[0], parent)
    else: 
        pass
    

    return ik_handle

def ik_single_chain_handle(startJoint = '', 
                           endEffector = '', 
                           autoPriority = False, 
                           snapEnable = True,
                           priority = 1,
                           weight = 1.0,
                           POWeight = 1.0, 
                           parent = ''):
    
    """
    @param startJoint = str, first joint of the ik 
    @param endEffector = str, last joint of the ik 
    @param parent = str, group under which you want to parent the created ik handle
    @param autoPriority = bool, specifies that this handle's priority is assigned automatically
    @param snapEnable = bool, if the handle is snapped to the end effector 
    @param sticky = str, specifies that this handle is "sticky". Valid values are "off", "sticky", "superSticky"
    @param priority = int, sets priority of the handle
    @param weight = float, specifies the handles weight in error calculations
    @param POWeight = float, specifies the position/orientation weight of a handle
    

    @return: list: ik_handle ([ik_handle_name, effector])

    DO :
    create ik single chain on ik joint chain
    """


    prefix = nomenclature.prefix['ikHandle']
    lower_name = startJoint
    handle_name = f'{prefix}_{lower_name}'

    ik_handle = cmds.ikHandle(n = handle_name,
                              sol = "ikSCsolver",
                              sj = startJoint,
                              ee = endEffector,
                              ap = autoPriority,
                              p = priority,
                              w = weight, 
                              pw = POWeight)

    cmds.setAttr(f'{handle_name}.snapEnable', snapEnable)

    if parent:
        cmds.parent(ik_handle[0], parent)
    else: 
        pass
    

    return ik_handle

def ik_spline_handle(startJoint = '',
                     endEffector = '',
                     curve = '',
                     rootOnCurve = True, 
                     autoCreateRootAxis = False,
                     autoParentCurve = True, 
                     snapCurveToRoot = False,
                     autoCreateCurve = True, 
                     autoSimplifyCurve = True,
                     spans = 4,
                     rootTwistMode = False, 
                     twistType = 'linear', 
                     parent = ''):

    """
    @param startJoint = str, first joint of the ik 
    @param endEffector = str, last joint of the ik 
    @param parent = str, group under which you want to parent the created ik handle
    @param curve = str, curve to use as spline (if it exists)
    @param rootOnCurve = bool, specifies if the root is locked onto the curve of the ikSplineHandle
    @param autoCreateRootAxis = bool, specifies if a root transform should automatically be created above the joints affected by the ikSplineHandle
    @param autoParentCurve = bool, specifies if the curve should automatically be parented to the parent of the first joint affected by the ikSplineHandle
    @param snapCurveToRoot = bool, specifies if the curve should automatically snap to the first joint affected by the ikSplineHandle
    @param autoCreateCurve = bool, specifies if a curve should be created as a spline
    @param autoSimplifyCurve = bool, to use with the autoCreateCurve specifies if the created curve should be simplified 
    @param spans = int, to use with autoSimplifyCurve, specifies if how many spans the curve should have
    @param rootTwistMode = bool, specifies whether the start joint is allowed to twist or not. If not, then the required twist is distributed over the remaining joints
    @param TwistType = str, specifies the type of interpolation to be used by the ikSplineHandle. The interpolation options are "linear", "easeIn", "easeOut", and "easeInOut"


    @return: list: ik_handle ([ik_handle_name, curve, effector])

    DO :
    create ik spline on ik joint chain
    """


    prefix = nomenclature.prefix['ikHandle']
    lower_name = startJoint
    handle_name = f'{prefix}_{lower_name}'


    if not curve:
        ik_handle = cmds.ikHandle(n = handle_name, 
                                sol = "ikSplineSolver",
                                sj = startJoint, 
                                ee = endEffector,
                                roc = rootOnCurve,
                                cra = autoCreateRootAxis,
                                pcv = autoParentCurve,
                                snc = snapCurveToRoot,
                                ccv = autoCreateCurve,
                                scv = autoSimplifyCurve,
                                ns = spans,
                                rtm = rootTwistMode,
                                tws = twistType,)
    else:
        ik_handle = cmds.ikHandle(n = handle_name, 
                                sol = "ikSplineSolver",
                                sj = startJoint, 
                                ee = endEffector,
                                c = curve,
                                roc = rootOnCurve,
                                cra = autoCreateRootAxis,
                                pcv = autoParentCurve,
                                snc = snapCurveToRoot,
                                ccv = False,
                                rtm = rootTwistMode,
                                tws = twistType)
    
    if parent:
        cmds.parent(ik_handle[0], parent)
    else: 
        pass
    

    return ik_handle

def create_ik_chain (refChain=[], parent='', ikType='rotate_plane', splineCurve='', radius=1.0):

    """
    @param refChain = list, give the base joint chain reference
    @param parent = str, parent group for all the creation
    @param ikType = str, ikHandle type: 'rotate_plane', 'single_chain', 'spline'
    @param splineCurve = str, works only in ikType='spline', specify the curve where to create the IK spine
    @param radius = float, specify joints radius
    
    @return list [list: ik joints, str: ikHandle name]
    """


    prefix_joint = nomenclature.prefix['joint']

    # create joint
    side = refChain[0].split('_')[-1]
    jntChain = ['_'.join(jnt.split('_')[1:-1]) for jnt in refChain]

    jntChain = joint_hierarchy(names=jntChain, prefix=prefix_joint, ikfk='ik', parent=parent, side=side, radius=radius)

    # move jntChain on skChain
    for i in range(len(refChain)):

        sk = refChain[i]
        jnt = jntChain[i]

        cmds.matchTransform(jnt, sk)
        cmds.makeIdentity(jnt, apply=1, r=1)

    # launch ikHandle
    definitions = {
    'rotate_plane': ik_rotate_plane_handle,
    'single_chain': ik_single_chain_handle,
    'spline': ik_spline_handle
    }
    
    if ikType == 'spline':
        ikHandle = definitions[ikType](
            startJoint = jntChain[0], 
            endEffector = jntChain[-1],
            parent = parent,
            curve = splineCurve
            )[0]
        
    else :
        ikHandle = definitions[ikType](
            startJoint = jntChain[0], 
            endEffector = jntChain[-1],
            parent = parent
            )[0]
        
    return jntChain, ikHandle

def create_fk_chain (refChain=[], parent='', radius=1.0):

    """
    @param refChain = list, give the base joint chain reference
    @param parent = str, parent group for all the creation
    @param radius = float, specify joints radius
    
    @return list: fk joints
    """


    prefix_joint = nomenclature.prefix['joint']

    # create joint
    side = refChain[0].split('_')[-1]
    jntChain = ['_'.join(jnt.split('_')[1:-1]) for jnt in refChain]

    jntChain = joint_hierarchy(names=jntChain, prefix=prefix_joint, ikfk='fk', parent=parent, side=side, radius=radius)

    # move jntChain on skChain
    for i in range(len(refChain)):

        sk = refChain[i]
        jnt = jntChain[i]

        cmds.matchTransform(jnt, sk)
        cmds.makeIdentity(jnt, apply=1, r=1)


    return jntChain

def create_sk_chain (refChain=[], parent='', radius=1.0):

    """
    @param refChain = list, give the base joint chain reference
    @param parent = str, parent group for all the creation
    @param radius = float, specify joints radius
    
    @return list: sk joints
    """


    prefix_joint = nomenclature.prefix['skinJoint']

    # create joint
    side = refChain[0].split('_')[-1]
    jntChain = ['_'.join(jnt.split('_')[1:-1]) for jnt in refChain]

    jntChain = joint_hierarchy(names=jntChain, prefix=prefix_joint, ikfk='', parent=parent, side=side, radius=radius)

    # move jntChain on skChain
    for i in range(len(refChain)):

        sk = refChain[i]
        jnt = jntChain[i]

        cmds.matchTransform(jnt, sk)
        cmds.makeIdentity(jnt, apply=1, r=1)


    return jntChain