import maya.cmds as cmds

from .. import nomenclature

from ..utils import controlers
from ..utils import constraints

def finger_master(ctrlAttr = "", ctrls =[]):
    
    """
    NOTE: add your text

    @param arg = str, add your explication
    
    @return str: add your explication

    DO :
    adds an attribute to control all the cstr of selected controlers at the same time
    """

    cstrs = controlers.add_cstr(controlers = ctrls, nameComplement = "fingerMaster")

    
    for cstr in cstrs:
        for axis in ["x", "y", "z"]:
            cmds.connectAttr(f'{ctrlAttr}.t{axis}', f'{cstr}.t{axis}')
            cmds.connectAttr(f'{ctrlAttr}.r{axis}', f'{cstr}.r{axis}')
            cmds.connectAttr(f'{ctrlAttr}.s{axis}', f'{cstr}.s{axis}')
    


def hand_set_up(metacarpals = [], ctrlMetacarpals = ['keyZ', 'blue', 1.2], ctrlsFingers = ['circle', 'blue', 1.0], parent = ''):
    
    """
    NOTE: wip

    @param metacarpals = list, firt joint of each finger
    @param ctrlMetacarpals = list, shape, color and scale of the metacarpals controlers 
    @param ctrlFingers = list, shape, color and scale of the finger controlers
    
    @return str: add your explication

    DO :
    add your text
    """

    prefix_joint = nomenclature.prefix["joint"]
    all_fingers = []
    all_metacarpals = []

    for jnt in metacarpals: 
        children = cmds.listRelatives(jnt, ad = True, ap = False)
        children.append(jnt)
        fk_joints = list(reversed(children))

        names = [joint.split(f'{prefix_joint}_')[-1] for joint in fk_joints]

        all_hierarchies = controlers.controler_hierarchy(names=names, parent=parent, shape=ctrlsFingers[0], scale=ctrlsFingers[2], color=ctrlsFingers[1], cstrGroup=True)
        all_fingers.append(all_hierarchies)

        metacarpalName = f'master_{("_").join(jnt.split("_")[1:])}'
        metacarpal = controlers.controler_hierarchy(names = [metacarpalName], parent = parent, shape = ctrlMetacarpals[0], scale = ctrlMetacarpals[2], color = ctrlMetacarpals[1], cstrGroup = True)
        cmds.matchTransform(metacarpal[0], jnt)

        all_metacarpals.append(metacarpal)
    

        for i in range(len(fk_joints)):
            jnt = fk_joints[i]
            hierarchy = all_hierarchies[i]
            off = hierarchy[0]
            ctrl = hierarchy[-1]

            cmds.matchTransform(off, jnt)
            constraints.matrixConstraint(ctrl, jnt)

            if i < len(fk_joints)-1:
                cmds.parent(all_hierarchies[i+1][0], ctrl)


    for i in range(len(metacarpals)):
        metacarpal = all_metacarpals[i][-1][-1]
        start_joint = all_fingers[i][0][0]
        
        cmds.parent(start_joint, metacarpal)

    

        hierarchy = all_metacarpals[i][-1]
        off = hierarchy[0]
        ctrl = hierarchy[-1]
        
        if i < len(fk_joints)-1:
            cmds.parent(all_metacarpals[i+1][0], ctrl)