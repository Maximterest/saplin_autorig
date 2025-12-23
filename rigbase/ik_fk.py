import maya.cmds as cmds

from .. import nomenclature

from ..utils import nodes


def switch_ik_fk (nodeList=[], ctrlAttr='', autoHideGroups=[]):

    """
    NOTE: autoHideGroups must be a list of 2

    @param nodeList = list, give the chain where to create the switch (can be skinJoints, locators, meshes...)
    @param ctrlAttr = str, controler attribute name
    @param autoHideGroups = list, give the parent group of ctrls ik and fk (ex: ['GRP_ik_leg_L', 'GRP_fk_leg_L'])

    DO:
    this will automatically search for the ik and fk chains (ex: ['JNT_ik_femur_L', ...], ['JNT_fk_femur_L', ...])
    create all custom attributes + node setup
    constraint the ik and fk hierarchy to the sk one
    """
    

    prefix_joint = nomenclature.prefix['joint']
    prefix_skinJoint = nomenclature.prefix['skinJoint']
    prefix_floatConstant = nomenclature.prefix['floatConstant']
    prefix_reverse = nomenclature.prefix['reverse']
    prefix_floatCondition = nomenclature.prefix['floatCondition']
    prefix_floatLogic = nomenclature.prefix['floatLogic']


    # set IK and FK chain

    ikChain = []
    fkChain = []

    for node in nodeList:

        prefix = node.split('_')[0]
        name = node.split('_')[1::]
        name = '_'.join(name)

        if prefix == prefix_skinJoint:
            prefix = prefix_joint
        else:
            pass

        ikName = f'{prefix}_ik_{name}'
        fkName = f'{prefix}_fk_{name}'

        ikChain.append(ikName)
        fkChain.append(fkName)


    if nodeList :
        
        #---------------------------------------
        # create attributes
        #---------------------------------------

        cmds.select(ctrlAttr)

        ctrlAttr_sn = ctrlAttr.split('_')[2::]
        ctrlAttr_sn = '_'.join(ctrlAttr_sn)

        sep_switch_ik_fk = f'{ctrlAttr_sn}_sep_switch_ik_fk'
        switch_ik_fk = f'{ctrlAttr_sn}_switch_ik_fk'

        cmds.addAttr(longName=sep_switch_ik_fk,
            niceName='| IK / FK |',
            k=False,
            at='enum',
            enumName='---------------'
            )
        cmds.setAttr(f'{ctrlAttr}.{sep_switch_ik_fk}', channelBox=True) # show the enum attr

        cmds.addAttr(longName=switch_ik_fk,
            niceName = 'Switch IK / FK',
            k=True,
            attributeType='float',
            min = 0, max = 10
            )
        

        #---------------------------------------
        # node setup and parent constraints
        #---------------------------------------

        facAttr_switch = nodes.create_facAttr(parent=ctrlAttr, parentAttr=switch_ik_fk)
            
        for i in range(len(nodeList)):

            node = nodeList[i]
            fkNode = fkChain[i]
            ikNode = ikChain[i]

            if cmds.ls(ikNode) and cmds.ls(fkNode) :

                # cstr
                cmds.parentConstraint([fkNode, ikNode], node, mo=1)
                cmds.scaleConstraint([fkNode, ikNode], node, mo=1)

                suffix = node.split('_')[1::]
                suffix = '_'.join(suffix)

                name_floatConstant = f'{prefix_floatConstant}_switch_fk_{suffix}'
                switch_fk = cmds.createNode('floatConstant', n=name_floatConstant, ss=1)

                name_reverse = f'{prefix_reverse}_switch_fk_{suffix}'
                switch_ik = cmds.createNode('reverse', n=name_reverse, ss=1)

                # connect nodes
                cmds.connectAttr(f'{facAttr_switch}.output', f'{switch_fk}.inFloat')

                cmds.connectAttr(f'{switch_fk}.outFloat', f'{node}_parentConstraint1.{fkNode}W0')
                cmds.connectAttr(f'{switch_fk}.outFloat', f'{node}_scaleConstraint1.{fkNode}W0')
                cmds.connectAttr(f'{switch_fk}.outFloat', f'{switch_ik}.inputX')

                cmds.connectAttr(f'{switch_ik}.outputX', f'{node}_parentConstraint1.{ikNode}W1')
                cmds.connectAttr(f'{switch_ik}.outputX', f'{node}_scaleConstraint1.{ikNode}W1')
            
            else :
                cmds.warning(f'from {nodeList}, ikChain or/and fkChain can not be founded in the scene:\n{ikChain}, {fkChain}')
                break

    else :
        pass


    # autoHide setup
    if autoHideGroups :
        if len(autoHideGroups) == 2 :
            
            if cmds.ls(autoHideGroups):
                
                cmds.select(ctrlAttr)

                ctrlAttr_sn = ctrlAttr.split('_')[2::]
                ctrlAttr_sn = '_'.join(ctrlAttr_sn)

                auto_hide_ik_fk = f'{ctrlAttr_sn}_auto_hide_ik_fk'

                cmds.addAttr(longName=auto_hide_ik_fk,
                    niceName = 'Auto Hide IK / FK',
                    k=True,
                    attributeType='bool',
                    dv = 1
                    )

                facAttr_autoHide = nodes.create_facAttr(parent=ctrlAttr, parentAttr=auto_hide_ik_fk, value=1)

                # node setup
                name_ik_floatLogic = f'{prefix_floatLogic}_auto_hide_ik_{ctrlAttr_sn}'
                name_fk_floatLogic = f'{prefix_floatLogic}_auto_hide_fk_{ctrlAttr_sn}'

                ik_floatLogic = cmds.createNode('floatLogic', n=name_ik_floatLogic, ss=1)
                fk_floatLogic = cmds.createNode('floatLogic', n=name_fk_floatLogic, ss=1)

                cmds.connectAttr(f'{facAttr_switch}.output', f'{ik_floatLogic}.floatA')
                cmds.connectAttr(f'{facAttr_switch}.output', f'{fk_floatLogic}.floatA')

                cmds.setAttr(f'{ik_floatLogic}.operation', 2)
                cmds.setAttr(f'{fk_floatLogic}.floatB', 0)
                cmds.setAttr(f'{fk_floatLogic}.operation', 3)
                

                name_ik_floatCondition = f'{prefix_floatCondition}_auto_hide_ik_{ctrlAttr_sn}'
                name_fk_floatCondition = f'{prefix_floatCondition}_auto_hide_fk_{ctrlAttr_sn}'

                ik_floatCondition = cmds.createNode('floatCondition', n=name_ik_floatCondition, ss=1)
                fk_floatCondition = cmds.createNode('floatCondition', n=name_fk_floatCondition, ss=1)

                cmds.connectAttr(f'{ik_floatLogic}.outBool', f'{ik_floatCondition}.floatA')
                cmds.connectAttr(f'{facAttr_autoHide}.output', f'{ik_floatCondition}.condition')
                cmds.connectAttr(f'{fk_floatLogic}.outBool', f'{fk_floatCondition}.floatA')
                cmds.connectAttr(f'{facAttr_autoHide}.output', f'{fk_floatCondition}.condition')

                ik_grp = None
                fk_grp = None

                for grp in autoHideGroups:
                    if 'ik' in grp:
                        ik_grp = grp
                    elif 'fk' in grp:
                        fk_grp = grp
                
                cmds.connectAttr(f'{ik_floatCondition}.outFloat', f'{ik_grp}.visibility')
                cmds.connectAttr(f'{name_fk_floatCondition}.outFloat', f'{fk_grp}.visibility')
                
            else :
                cmds.warning(f'{autoHideGroups} can not be found in the scene')

        else :
            cmds.warning(f'{autoHideGroups} must be a list of 2, ik and fk groups')

    else :
        pass

def auto_stretch_ik (joints=[], ctrlAttr='', parent=''):

    """
    @param joints = list, give the skinJoints (SK) chain where to create the auto_stretch
    @param ctrlAttr = str, controler attribute name
    @param mainAxis = str, valid values are: 'x', 'y', 'z'
    """

    prefix_ctrl = nomenclature.prefix['controler']
    prefix_joint = nomenclature.prefix['joint']
    prefix_locator = nomenclature.prefix['locator']
    prefix_ikHandle = nomenclature.prefix['ikHandle']
    prefix_floatCondition = nomenclature.prefix['floatCondition']
    prefix_floatLogic = nomenclature.prefix['floatLogic']
    prefix_floatMath = nomenclature.prefix['floatMath']
    prefix_pairBlend = nomenclature.prefix['pairBlend']
    prefix_addDoubleLinear = nomenclature.prefix['addDoubleLinear']


    #---------------------------------------
    # set IK and FK chain
    #---------------------------------------

    ikChain = []

    for joint in joints:
        
        prefix = prefix_joint
        name = joint.split('_')[1::]
        name = '_'.join(name)

        ikName = f'{prefix}_ik_{name}'

        ikChain.append(ikName)


    #---------------------------------------
    # create attributes
    #---------------------------------------

    cmds.select(ctrlAttr)

    ctrlAttr_sn = ctrlAttr.split('_')[2::]
    ctrlAttr_sn = '_'.join(ctrlAttr_sn)

    separator = f'{ctrlAttr_sn}_sep_stretch_ik'
    auto_stretch_ik = f'{ctrlAttr_sn}_auto_stretch_ik'
    stretch_ik = f'{ctrlAttr_sn}_stretch_ik'

    cmds.addAttr(longName = separator,
        niceName = '| IK |',
        k = 0,
        at = 'enum',
        enumName = '---------------'
        )

    cmds.setAttr(f'{ctrlAttr}.{separator}', channelBox=1) # show the enum attr

    cmds.addAttr(longName = auto_stretch_ik,
                niceName = 'Auto Stretch IK',
                k = 1,
                attributeType='float',
                min = 0, max = 10,
                dv = 10
                )
    
    cmds.addAttr(longName = stretch_ik,
                niceName = 'Stretch IK',
                k = 1,
                attributeType = 'float'
                )
    

    #---------------------------------------
    # locators distance
    #---------------------------------------

    loc_distance_top = cmds.spaceLocator(n=f'{prefix_locator}_distance_to_{prefix_ikHandle}_{ikChain[0]}')[0]
    cmds.matchTransform(loc_distance_top, ikChain[0])
    cmds.pointConstraint(ikChain[0], loc_distance_top)
    cmds.aimConstraint(f'{prefix_ikHandle}_{ikChain[0]}', loc_distance_top)

    loc_distance_bot = cmds.spaceLocator(n=f'{prefix_locator}_distance_to_{prefix_ikHandle}_{ikChain[-1]}')[0]
    cmds.matchTransform(loc_distance_bot, ikChain[-1])
    cmds.pointConstraint(f'{prefix_ikHandle}_{ikChain[0]}', loc_distance_bot)

    cmds.parent(loc_distance_bot, loc_distance_top)
    
    if parent:
        cmds.parent(loc_distance_top, parent)
    else:
        pass


    #---------------------------------------
    # node setup
    #---------------------------------------

    # facAttrs

    facAttr_auto_stretch = nodes.create_facAttr (parent=ctrlAttr, parentAttr=auto_stretch_ik)
    facAttr_stretch = nodes.create_facAttr (parent=ctrlAttr, parentAttr=stretch_ik)

    # create nodes

    initial_lengh = cmds.createNode('floatMath', n=f'{prefix_floatMath}_add_initial_lengh_{ctrlAttr_sn}', ss=1)

    div_auto_stretch_ik = cmds.createNode('floatMath', n=f'{prefix_floatMath}_div_auto_stretch_ik_{ctrlAttr_sn}', ss=1)

    fl_auto_stretch_ik = cmds.createNode('floatLogic', n=f'{prefix_floatLogic}_auto_stretch_ik_{ctrlAttr_sn}', ss=1)

    fc_auto_stretch_ik = cmds.createNode('floatCondition', n=f'{prefix_floatCondition}_auto_stretch_ik_{ctrlAttr_sn}', ss=1)

    pb_auto_stretch_ik = cmds.createNode('pairBlend', n=f'{prefix_pairBlend}_auto_stretch_ik_{ctrlAttr_sn}', ss=1)

    add_stretch_ik = cmds.createNode('addDoubleLinear', n=f'{prefix_addDoubleLinear}_stretch_ik_{ctrlAttr_sn}', ss=1)
    

    # initial_lengh
    valueA = cmds.getAttr(f'{ikChain[1]}.tz')
    if valueA < 0:
        valueA = - valueA
    
    value_joints = 0
    for jnt in ikChain[2:] :
        value_joints = value_joints + cmds.getAttr(f'{jnt}.tz')

    valueB = value_joints
    if valueB < 0:
        valueB = - valueB
    
    cmds.setAttr(f'{initial_lengh}.floatA', valueA)
    cmds.setAttr(f'{initial_lengh}.floatB', valueB)

    # div_auto_stretch_ik
    cmds.connectAttr(f'{loc_distance_bot}.tx', f'{div_auto_stretch_ik}.floatA')
    cmds.connectAttr(f'{initial_lengh}.outFloat', f'{div_auto_stretch_ik}.floatB')

    cmds.setAttr(f'{div_auto_stretch_ik}.operation', 3)

    # fl_auto_stretch_ik
    cmds.connectAttr(f'{div_auto_stretch_ik}.outFloat', f'{fl_auto_stretch_ik}.floatA')

    cmds.setAttr(f'{fl_auto_stretch_ik}.operation', 3)

    # fc_auto_stretch_ik
    cmds.connectAttr(f'{div_auto_stretch_ik}.outFloat', f'{fc_auto_stretch_ik}.floatA')
    cmds.connectAttr(f'{fl_auto_stretch_ik}.outBool', f'{fc_auto_stretch_ik}.condition')

    # pb_auto_stretch_ik
    cmds.connectAttr(f'{fc_auto_stretch_ik}.outFloat', f'{pb_auto_stretch_ik}.inTranslateX2')
    cmds.connectAttr(f'{facAttr_auto_stretch}.output', f'{pb_auto_stretch_ik}.weight')

    cmds.setAttr(f'{pb_auto_stretch_ik}.inTranslateX1', 1)

    # add_stretch_ik
    cmds.connectAttr(f'{pb_auto_stretch_ik}.outTranslateX', f'{add_stretch_ik}.input1')
    cmds.connectAttr(f'{facAttr_stretch}.output', f'{add_stretch_ik}.input2')

    for joint in ikChain:
        cmds.connectAttr(f'{add_stretch_ik}.output', f'{joint}.sz')


