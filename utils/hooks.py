import maya.cmds as cmds

from .. import nomenclature


def create_hook (parent='', child='', addName=''):

    '''
    NOTE: a hook has the same result than a parent constraint

    @param parent = str, the parent node
    @param child = str, the constraint node
    @param addName = str, add a name if you create multiple hooks from the same parent, start by adding '_'

    @return str: hook, name

    DO :
    create a transform:
    connect the worldMatrix of the parent to the offsetParentMatrix of the child
    '''

    hook_prefix = nomenclature.prefix['hook']
    hook = cmds.createNode('transform', name=f'{hook_prefix}{addName}_from_{parent}', ss=1)

    # lock hookNode transforms
    attrs = ['translate', 'rotate', 'scale', 'shear']
    values = [0, 0, 1, 0]
    axes = ['X','Y','Z']

    for i in range(len(attrs)):

        attr = attrs[i]
        value = values[i]

        if attr == 'shear':
            axes = ['XY','YZ','XZ']

        for axis in axes:
            cmds.setAttr(f'{hook}.{attr}{axis}', value, lock=1)
        
    cmds.setAttr(f'{hook}.inheritsTransform', 0, lock=1) # unCheck inheritsTransform and lock
    
    cmds.connectAttr(f'{parent}.worldMatrix[0]', f'{hook}.offsetParentMatrix')

    #parent the hook
    child_parents = cmds.listRelatives(child, parent=1, path=1)
    cmds.parent(child, hook)
    
    if child_parents :
        cmds.parent(hook, child_parents[0])[0]
    

    return hook

def create_hook_on_surface (surface='', child='', UVs=[0.0, 0.0], reset=True):

    '''
    @param surface = str, surface name where to create the hook on
    @param child = str, set the hook child
    @param UVs = list, determine hook position on the surface
        float values go from 0 to 2 for a 2D UVs
    @param reset = bool, reset matrix of the child or not
    
    @return str: hook, name of the group
    '''


    prefix_hook = nomenclature.prefix['hook']
    prefix_surface = nomenclature.prefix['surface']
    prefix_pointOnSurfaceInfo = nomenclature.prefix['pointOnSurfaceInfo']
    prefix_fourByFourMatrix = nomenclature.prefix['fourByFourMatrix']
    prefix_multMatrix = nomenclature.prefix['multMatrix']
    prefix_decomposeMatrix = nomenclature.prefix['decomposeMatrix']


    name = f'{prefix_surface}_for_{child}'
        
        
    # Nodes

    hook = cmds.createNode('transform', n=f'{prefix_hook}_{name}', ss=1)
    posi = cmds.createNode('pointOnSurfaceInfo', n=f'{prefix_pointOnSurfaceInfo}_{name}', ss=1)
    fbfmx = cmds.createNode('fourByFourMatrix', n=f'{prefix_fourByFourMatrix}_{name}', ss=1)
    mmx = cmds.createNode('multMatrix', n=f'{prefix_multMatrix}_{name}', ss=1)
    dmx = cmds.createNode('decomposeMatrix', n=f'{prefix_decomposeMatrix}_{name}', ss=1)


    # setAttrs

    cmds.setAttr(f'{posi}.parameterU', UVs[0])
    cmds.setAttr(f'{posi}.parameterV', UVs[1])


    # Child steps

    if child :

        try : childParent = cmds.listRelatives(child, p=1, path=1)
        except : childParent = ''

        cmds.parent(child, hook)

        if childParent:
            cmds.parent(hook, childParent)[0]
        
        if reset:
            cmds.xform(child,
            matrix=[1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0], # default values
            ws=1)
            
            cmds.matchTransform(child, hook)


    # Connections

    cmds.connectAttr(f'{surface}.worldSpace[0]', f'{posi}.inputSurface')

    attrs = ['position', 'normalizedNormal', 'normalizedTangentU', 'normalizedTangentV']
    attrConnections = ['3', '0', '1', '2']

    for i in range(len(attrs)):
        attr = attrs[i]
        attrConnection = attrConnections[i]
        axis = ['X', 'Y', 'Z']

        for a in range(3):
            cmds.connectAttr(f'{posi}.{attr}{axis[a]}', f'{fbfmx}.in{attrConnection}{a}')

    cmds.connectAttr(f'{fbfmx}.output', f'{mmx}.matrixIn[0]')
    cmds.connectAttr(f'{hook}.parentInverseMatrix[0]', f'{mmx}.matrixIn[1]')
    cmds.connectAttr(f'{mmx}.matrixSum', f'{dmx}.inputMatrix')

    attrs = ['translate', 'rotate']

    for attr in attrs:
        cmds.connectAttr(f'{dmx}.output{attr.title()}', f'{hook}.{attr}')


    return hook

def create_hook_on_curve (curve='', child='', position=0.0, reset=True):

    '''
    @param curve = str, curve name where to create the hook on
    @param child = str, set the hook child
    @param position = float, determine hook position on the surface
        values go from 0 to 3 for a 3 degree curve
    @param reset = bool, reset matrix of the child or not
    
    @return str: hook, name of the group
    '''


    prefix_hook = nomenclature.prefix['hook']
    prefix_pointOnCurveInfo = nomenclature.prefix['pointOnCurveInfo']
    prefix_fourByFourMatrix = nomenclature.prefix['fourByFourMatrix']
    prefix_multMatrix = nomenclature.prefix['multMatrix']
    prefix_decomposeMatrix = nomenclature.prefix['decomposeMatrix']


    name = curve
    if child :
        name += f'_for_{child}'
    
    
    # Nodes

    hook = cmds.createNode('transform', n=f'{prefix_hook}_{name}', ss=1)
    posi = cmds.createNode('pointOnCurveInfo', n=f'{prefix_pointOnCurveInfo}_{name}', ss=1)
    fbfmx = cmds.createNode('fourByFourMatrix', n=f'{prefix_fourByFourMatrix}_{name}', ss=1)
    mmx = cmds.createNode('multMatrix', n=f'{prefix_multMatrix}_{name}', ss=1)
    dmx = cmds.createNode('decomposeMatrix', n=f'{prefix_decomposeMatrix}_{name}', ss=1)


    # setAttrs

    cmds.setAttr(f'{posi}.parameter', position)
    

    # Connections

    cmds.connectAttr(f'{curve}.worldSpace[0]', f'{posi}.inputCurve')

    attrs = ['position', 'normalizedNormal', 'normalizedTangent']
    attrConnections = ['3', '0', '1']

    for i in range(len(attrs)):
        attr = attrs[i]
        attrConnection = attrConnections[i]
        axis = ['X', 'Y', 'Z']

        for a in range(3):
            cmds.connectAttr(f'{posi}.{attr}{axis[a]}', f'{fbfmx}.in{attrConnection}{a}')

    cmds.connectAttr(f'{fbfmx}.output', f'{mmx}.matrixIn[0]')
    cmds.connectAttr(f'{hook}.parentInverseMatrix[0]', f'{mmx}.matrixIn[1]')
    cmds.connectAttr(f'{mmx}.matrixSum', f'{dmx}.inputMatrix')

    attrs = ['translate', 'rotate', 'scale', 'shear']

    for attr in attrs:
        cmds.connectAttr(f'{dmx}.output{attr.title()}', f'{hook}.{attr}')


    # Child steps

    if child :

        try : childParent = cmds.listRelatives(child, p=1, path=1)
        except : childParent = ''

        cmds.parent(child, hook)

        if childParent:
            hook = cmds.parent(hook, childParent)
            
        if reset:
            cmds.xform(child,
            matrix=[1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0], # default values
            ws=1)
            
            cmds.matchTransform(child, hook)


    return hook