import maya.cmds as cmds


def list_data_group (grp=''):

    """
    NOTE: add your text

    @param arg = str, add your explication
    
    @return str: add your explication

    DO :
    add your text
    """


    nodes = cmds.listRelatives(grp, ad=1, f=1)
    types = [cmds.nodeType(node) for node in nodes ]

    print(nodes)
    print(types)