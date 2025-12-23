import maya.cmds as cmds

from .. import nomenclature

from ..utils import hooks
from ..utils import controlers
from ..utils import constraints


def create_ribbon_on_surface (surface='', jntNumber=10, UVsMode=0, parent='', ctrls=[3, 'circle', 'lightBlue', 1.0], radius=1.0, cstrGroup=False):

    """
    @param surface = str, surface name where to create the hook on
    @param jntNumber = int, joint number for the ribbon
    @param UVsMode = int, 0 = U / 1 = V
    @param parent = str, parent group for all the creation
    @param ctrls = list, [number = int, shape = str, color = str, scale = float]
    @param radius = float, joints radius
    @param cstrGroup = bool, create cstr group or not for controlers hierarchies
    """


    factorTW = 7.2 

    prefix_group = nomenclature.prefix['group']
    prefix_skinJoint = nomenclature.prefix['skinJoint']
    prefix_surface = nomenclature.prefix['surface']
    prefix_hook = nomenclature.prefix['hook']
    prefix_twist = nomenclature.prefix['twist']
    prefix_skinJointSurface = nomenclature.prefix['skinJointSurface']
    prefix_ctrl = nomenclature.prefix['controler']
    
    
    side = surface.split('_')[-1]
    baseName = surface.split(f'{prefix_surface}_')[-1].split(f'_{side}')[0]


    # Create joints and hooks
    
    grpHooks = cmds.createNode('transform', n=f'{prefix_group}_{prefix_hook}_{surface}', p=parent, ss=1)


    maxU = cmds.getAttr( f"{surface}.minMaxRangeU.maxValueU" )
    maxV = cmds.getAttr( f"{surface}.minMaxRangeV.maxValueV" )
    
    if UVsMode == 0:
        distance = maxU/(jntNumber-1)
    else:
        distance = maxV/(jntNumber-1)
    
    
    hookGrps = []
    UVs = [0.5, 0.5]

    for i in range(jntNumber):
        
        number = f'0{i+1}'
        if i > 8 :
            number = i+1
            
        jntName = f'{prefix_skinJoint}_{baseName}_{number}_{side}'
        cmds.joint(n=jntName, rad=radius)
        cmds.parent(jntName, grpHooks)
        
        if UVsMode == 0:
            UVs[0] = distance*i
        else:
            UVs[1] = distance*i
        
        hook = hooks.create_hook_on_surface(surface=surface, child=jntName, UVs=UVs, reset=True)

        cmds.select(deselect=1)

        hookGrps.append(hook)

    
    # Create joints

    grpSKsurf = cmds.createNode('transform', n=f'{prefix_group}_{prefix_skinJointSurface}_{prefix_twist}_{baseName}_{side}', p=parent, ss=1)
    
    if UVsMode == 0:
        distance = maxU/(ctrls[0]-1)
    else:
        distance = maxV/(ctrls[0]-1)

    names = []
    SKsurf = []
    UVs = [0.5, 0.5]

    for i in range(ctrls[0]):
        
        name = f'{prefix_twist}_{baseName}_0{i+1}_{side}'
        if i > 8:
            name = f'{prefix_twist}_{baseName}_{i+1}_{side}'

        cmds.select(d=1)
        joint = cmds.joint(n=f'{prefix_skinJointSurface}_{name}', rad=radius*1.5)

        if UVsMode == 0:
            UVs[0] = distance*i
        else:
            UVs[1] = distance*i
        
        hookTemp = hooks.create_hook_on_surface(surface=surface, child=joint, UVs=UVs, reset=True)
        cmds.parent(joint, grpSKsurf)

        cmds.delete(hookTemp)
        cmds.makeIdentity(joint, r=1, a=1)
        cmds.setAttr(f'{joint}.r', -90, -90, 0)
        cmds.makeIdentity(joint, r=1, a=1)

        names.append(name)
        SKsurf.append(joint)
    

    # Create controlers

    grpCtrls = cmds.createNode('transform', n=f'{prefix_group}_{prefix_ctrl}_{prefix_twist}_{baseName}_{side}', p=parent, ss=1)
    
    hierarchies = controlers.controler_hierarchy(names=names, parent=grpCtrls, cstrGroup=cstrGroup, scale=ctrls[3] * factorTW, shape=ctrls[1], color=ctrls[2])

    for i in range(len(hierarchies)) :

        off = hierarchies[i][0]
        ctrl = hierarchies[i][-1]
        jnt = SKsurf[i]

        cmds.matchTransform(off, jnt)
        constraints.matrixConstraint(ctrl, jnt)
    
    SKsurf.append(surface)
    cmds.skinCluster(SKsurf, bindMethod=1, mi=3, dr=4)


    return hierarchies

def create_ribbon_on_curve (curve='', jntNumber=10, parent='', ctrls=[3, 'circle', 'lightBlue', 1.0], radius=1.0, cstrGroup=False):

    """
    @param curve = str, curve name where to create the hook on
    @param jntNumber = int, joint number for the ribbon
    @param parent = str, parent group for all the creation
    @param ctrls = list, [number = int, shape = str, color = str, scale = float]
    @param radius = float, joints radius
    @param cstrGroup = bool, create cstr group or not for controlers hierarchies
    """

    prefix_group = nomenclature.prefix['group']
    prefix_skinJoint = nomenclature.prefix['skinJoint']
    prefix_curve = nomenclature.prefix['curve']
    prefix_hook = nomenclature.prefix['hook']
    prefix_twist = nomenclature.prefix['twist']
    prefix_skinJointSurface = nomenclature.prefix['skinJointSurface']
    prefix_ctrl = nomenclature.prefix['controler']
    
    
    side = curve.split('_')[-1]
    baseName = curve.split(f'{prefix_curve}_')[-1].split(f'_{side}')[0]


    # Create joints and hooks
    
    grpHooks = cmds.createNode('transform', n=f'{prefix_group}_{prefix_hook}_{curve}', p=parent, ss=1)


    distance = cmds.getAttr(f'{curve}.maxValue')/(jntNumber-1)
    
    hookGrps = []

    for i in range(jntNumber):
        
        number = f'0{i+1}'
        if i > 8 :
            number = i+1
            
        jntName = f'{prefix_skinJoint}_{baseName}_{number}_{side}'
        cmds.joint(n=jntName, rad=radius)
        cmds.parent(jntName, grpHooks)
        
        position = distance*i
            
        hook = hooks.create_hook_on_curve(curve=curve, child=jntName, position=position, reset=True)
        hookGrps.append(hook)
        
    
    # Create joints

    grpSKsurf = cmds.createNode('transform', n=f'{prefix_group}_{prefix_skinJointSurface}_{prefix_twist}_{baseName}_{side}', p=parent, ss=1)
    
    distance = cmds.getAttr(f'{curve}.maxValue')/(ctrls[0]-1)

    names = []
    SKcurv = []

    for i in range(ctrls[0]):
        
        name = f'{prefix_twist}_{baseName}_0{i+1}_{side}'
        if i > 8:
            name = f'{prefix_twist}_{baseName}_{i+1}_{side}'

        cmds.select(d=1)
        joint = cmds.joint(n=f'{prefix_skinJointSurface}_{name}', rad=radius*1.5)

        position = distance*i
        
        hookTemp = hooks.create_hook_on_curve(curve=curve, child=joint, position=position, reset=True)
        cmds.parent(joint, grpSKsurf)

        cmds.delete(hookTemp)
        
        cmds.makeIdentity(joint, r=1, a=1)
        cmds.setAttr(f'{joint}.r', -90, -90, 0)
        cmds.makeIdentity(joint, r=1, a=1)

        names.append(name)
        SKcurv.append(joint)
    

    # Create controlers

    grpCtrls = cmds.createNode('transform', n=f'{prefix_group}_{prefix_ctrl}_{prefix_twist}_{baseName}_{side}', p=parent, ss=1)
    
    hierarchies = controlers.controler_hierarchy(names=names, parent=grpCtrls, cstrGroup=cstrGroup, scale=ctrls[3], shape=ctrls[1], color=ctrls[2])

    for i in range(len(hierarchies)) :

        off = hierarchies[i][0]
        ctrl = hierarchies[i][-1]
        jnt = SKcurv[i]

        cmds.matchTransform(off, jnt)
        constraints.matrixConstraint(ctrl, jnt)
    
    SKcurv.append(curve)
    cmds.skinCluster(SKcurv, bindMethod=1, mi=3, dr=4)


    return hierarchies