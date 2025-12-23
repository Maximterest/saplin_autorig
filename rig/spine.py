import maya.cmds as cmds


from .. import nomenclature

from ..utils import joints
from ..utils import surfaces
from ..utils import hooks
from ..utils import shapes

from ..tools import hierarchies

from ..rigbase import ik_fk
from ..rigbase import ribbons


def build ( 
            templateChain=[],
            fkCtrls=['circle', 'red', 1.0],
            ikCtrls=['square', 'blue', 1.0],
            radius=1.0,
            doBendTwist=True,
            jntNumber=4,
            UVsMode=0,
            createEnd=False,
            ):

    """
    @param templateChain = list, template joints
    @param fkCtrls = list, [shape = str, color = str, scale = float]
    @param ikCtrls = list, [shape = str, color = str, scale = float]
    @param radius = float, specify joints radius
    @param doBendTwist = bool, create ribbon on limb or not
    @param jntNumber = int, number of joints to create on the ribbon
    @param UVsMode = int, 0 = U / 1 = V
    @param createEnd = bool, define if you create last controler or not
    
    @return str: dataGroup, parent group of all the limb creation
    """


    factorFK = 22
    factorIK = 23

    prefix_dataGroup = nomenclature.prefix['dataGroup']
    prefix_group = nomenclature.prefix['group']
    prefix_surface = nomenclature.prefix['surface']
    prefix_offset = nomenclature.prefix['offset']
    prefix_skinJoint = nomenclature.prefix['skinJoint']
    prefix_skinJointSurface = nomenclature.prefix['skinJointSurface']
    prefix_hook = nomenclature.prefix['hook']
    prefix_controler = nomenclature.prefix['controler']
    
    
    side =  templateChain[0].split('_')[-1]
    limb = templateChain[0].split('_')[1]
    

    # create data group
    dataGroup = cmds.createNode('transform', n=f'{prefix_dataGroup}_limb_{limb}_{side}', ss=1)


    #===============================================================================
    # SK joints
    #===============================================================================
    
    if not doBendTwist :
        
        sk_joints = joints.create_sk_chain(
            refChain=templateChain,
            parent=dataGroup,
            radius=radius
            )


    #===============================================================================
    # Twists and Bend
    #===============================================================================

    if doBendTwist :
        
        # create surfaces

        grpSurfaces = cmds.createNode('transform', n=f'{prefix_group}_{prefix_surface}_{limb}_{side}', p=dataGroup, ss=1)

        name = f'{prefix_surface}_{limb}_{side}'
        surface = surfaces.create_loft_surface(
            name=name,
            points=templateChain,
            widthSize=radius*7,
            spansNumber=0,
            parent=grpSurfaces
            )


        # create hook and joint on surface

        hookSurfGrp = cmds.createNode('transform', n=f'{prefix_group}_{prefix_hook}_{surface}', parent=dataGroup, ss=1)

        maxU = cmds.getAttr( f"{surface}.minMaxRangeU.maxValueU" )
        maxV = cmds.getAttr( f"{surface}.minMaxRangeV.maxValueV" )
                
        if UVsMode == 0:
            distance = maxU/(jntNumber-1)
        else:
            distance = maxV/(jntNumber-1)
        
        UVs = [0.5, 0.5]
        sk_joints = []

        for i in range(jntNumber):
            
            number = f'0{i+1}'
            if i > 8 :
                number = i+1

            skName = f'{prefix_skinJoint}_{limb}_{number}_{side}'

            cmds.select(hookSurfGrp)
            cmds.joint(n=skName, rad=radius)

            if UVsMode == 0:
                UVs[0] = distance*i
            else:
                UVs[1] = distance*i
                
            hook = hooks.create_hook_on_surface(surface=surface, child=skName, UVs=UVs, reset=True)

            sk_joints.append(skName)

        if createEnd == False :
            cmds.delete(sk_joints[-1])
        

        # create SKsurf

        skSurfGrp = cmds.createNode('transform', n=f'{prefix_group}_{prefix_skinJointSurface}_{limb}_{side}', p=dataGroup, ss=1)

        baseSKsurfName = []
        for i in range(len(templateChain)):
            
            number = f'0{i+1}'
            if i > 8 :
                number = i+1
                
            jntName = f'{limb}_{number}'
            baseSKsurfName.append(jntName)

        skSurfJnt = joints.joint_hierarchy(names=baseSKsurfName, prefix=prefix_skinJointSurface, ikfk='', parent=skSurfGrp, side=side, radius=radius, chain=True)

        for i in range(len(templateChain)) :

            tpl = templateChain[i]
            SKsurf = skSurfJnt[i]

            cmds.matchTransform(SKsurf, tpl)

    
    #===============================================================================
    # Hybrid IK/FK
    #===============================================================================

    grpCtrlIkFk = cmds.createNode('transform', n=f'{prefix_group}_{prefix_controler}_ikfk_{limb}_{side}', p=dataGroup, ss=1)


    # hierarchy
    
    if doBendTwist :
        hybridJoints = skSurfJnt

        if createEnd == False :
            hybridJoints = skSurfJnt[0:-1]

    else :
        hybridJoints = sk_joints

        if createEnd == False :
            hybridJoints = sk_joints[0:-1]


    all_hierarchies = hierarchies.hybrid_hierarchy(
        refChain=sk_joints,
        ctrlFk=[fkCtrls[0], fkCtrls[1], fkCtrls[2] * factorFK],
        ctrlIk=[ikCtrls[0], ikCtrls[1], ikCtrls[2] * factorIK],
        radius=radius,
        cstrGroup=False,
        parent=grpCtrlIkFk,
        doJoint=False,
        hybrid_joints=hybridJoints
        )[-1]


    # rotate shapes

    for all_hierarchy in all_hierarchies[0: len(all_hierarchies)//2]:

        ctrl = all_hierarchy[-1]
        shapes.rotate(ctrl, rotate=[90, 0, 0])


    # connect ribbons

    if doBendTwist :

        toSkin = skSurfJnt
        toSkin.append(surface)
        
        cmds.skinCluster(toSkin, bindMethod=1, mi=3, dr=4)


    return dataGroup