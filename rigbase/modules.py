import maya.cmds as cmds

from .. import nomenclature

from ..utils import controlers


#=======================================================================================
#
# WARNING: rigging pipeline groups
#
#=======================================================================================


mainGroups = ['MESHES', 'RIG']
secondGroups = ['CTRLS', 'LOCS', 'SURFACES', 'SKS', 'JNTS', 'DEFORMERS', 'SIM']
subGroups = ['ctrls_main', 'ctrls']


def main_groups_structure (assetName='ASSETNAME'):

    """
    DO :
    create main groups template

    @param assetName = str, name of the asset project

    @return list: all hooks created
    """

    
    prefix_hook = nomenclature.prefix['hook']
    
    
    #---------------------------------------
    # base group
    #---------------------------------------

    base = cmds.createNode('transform', n=assetName, ss=1)

    #---------------------------------------
    # main groups
    #---------------------------------------

    parent = base

    for group in mainGroups:
        cmds.createNode('transform', n=group, p=parent, ss=1)
 
    #---------------------------------------
    # second groups
    #---------------------------------------

    parent = mainGroups[-1]

    for group in secondGroups:
        cmds.createNode('transform', n=group, p=parent, ss=1)


    # CTRLS childs groups
    parent = secondGroups[0]

    # ctrls_main hierarchy
    ctrls_main = cmds.createNode('transform', n=subGroups[0], p=parent, ss=1)
    controlers.controler_hierarchy()


    # ctrls hierarchy
    ctrls = cmds.createNode('transform', n=subGroups[1], p=parent, ss=1)


    #---------------------------------------
    # hooks
    #---------------------------------------
    
    hooks = []

    # CTRLS
    hook = cmds.createNode('transform', n=f'{prefix_hook}_{ctrls_main}', p=ctrls, ss=1)
    target = cmds.createNode('transform', n=f'target_{ctrls_main}', p=ctrls_main, ss=1)
    cmds.connectAttr(f'{target}.worldMatrix[0]', f'{hook}.offsetParentMatrix')

    hooks.append(hook)
    
    
    # Other second groups
    
    for group in secondGroups[1:]:
        
        hook = cmds.createNode('transform', n=f'{prefix_hook}_{group}_main', p=group, ss=1)
        cmds.connectAttr(f'{target}.worldMatrix[0]', f'{hook}.offsetParentMatrix')

        hooks.append(hook)
    

    return hooks
