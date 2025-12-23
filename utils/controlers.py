import maya.cmds as cmds

from .. import nomenclature
from .. import color_index

from ..utils import shapes


def controler_hierarchy (names=[], parent="", cstrGroup=False, scale=1.0, shape="", color="yellow"):

    """
    @param names = str, names of the controllers you want to create
    @param parent = str, node under which you whan to prent the created offsets
    @param cstrGroup = bool, wether you want a cstr or not
    @param scale = float, set controler scale
    @param shape = str, describes what shape you want the controller to take 
    @param color = str, color of the controlers you want to create

    @return list [list: hierarchy 01, list: hierarchy 02, ...]
    """
    
    
    all_hierarchies = []

    for name in names:

        individual_hierarchy = []

        # ctrl
        prefix_ctrl = nomenclature.prefix["controler"]
        ctrl_name = f'{prefix_ctrl}_{name}'
        ctrl_node = cmds.createNode('transform', n=ctrl_name, ss=1)
        shapes.shape_copy(childs=[ctrl_name], shape=shape, color=color, scale=[scale, scale, scale])

        individual_hierarchy.append(ctrl_node)

        group_parent = ctrl_node

        # cstr
        if cstrGroup == True:
            prefix_cstr = nomenclature.prefix["constraint"]
            cstr_name = f'{prefix_cstr}_{name}'
            cstr_node = cmds.createNode('transform', n=cstr_name, ss=1)
            cmds.parent(ctrl_node, cstr_node)

            group_parent = cstr_node
        
            individual_hierarchy.append(cstr_node)
        
        else:
            pass

        # off
        prefix_off = nomenclature.prefix["offset"]
        off_name =  f'{prefix_off}_{name}'
        off_node = cmds.createNode('transform', n=off_name, ss=1)
        cmds.parent(group_parent, off_node)

        individual_hierarchy.append(off_node)

        #------------------------------

        individual_hierarchy.reverse()

        all_hierarchies.append(individual_hierarchy)

        if parent:
            cmds.parent(off_node, parent)
        else:
            pass


    return all_hierarchies

def ctrl_color (ctrl='', color='yellow'):

    """
    @param ctrl = give controler name
    @param color = str, valids args are: 'yellow', 'red', 'lightRed', 'bordeau', 'blue', 'lightBlue', 'pink', ...
    """
    
    # color index go from 0 to 31
    color_value = color_index.color_index[color]

    R = color_value[0]
    G = color_value[1]
    B = color_value[2]

    ctrlAttr_override = f'{ctrl}.overrideEnabled'
    ctrlAttr_override_RGB = f'{ctrl}.overrideRGBColors'
    ctrlAttr_color = f'{ctrl}.overrideColorRGB'

    cmds.setAttr(ctrlAttr_override, 1)
    cmds.setAttr(ctrlAttr_override_RGB, 1)
    cmds.setAttr(ctrlAttr_color, R, G, B, type = "double3")

def add_cstr (controlers = [], nameComplement = ""):

    """
    @param controlers = list, specifies all the controlers that need an extra constraint
    @param nameComplement = str, what to put between the prefix and name of the controler, to clarify what is the constraint used for and avoid node with the same name

    @return : list, all the extra constraint nodes created
    """


    cstrList = []
    cmds.select(clear = True)

    for ctrl in controlers:
        prefix = nomenclature.prefix["constraint"]

        ctrlName = '_'.join(ctrl.split("_")[1:])
        
        if nameComplement:
            cstrName = f'{prefix}_{nameComplement}_{ctrlName}'
        
        else:
            cstrName = f'{prefix}_{ctrlName}'

        off = cmds.listRelatives(ctrl, p= True)[0]

        cstr = cmds.group(em = True, n = cstrName)

        cmds.matchTransform(cstr, off)

        cmds.parent(cstr, off)
        cmds.parent(ctrl, cstr)

        cstrList.append(cstr)
    

    return cstrList
