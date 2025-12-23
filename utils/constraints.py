import maya.cmds as cmds

from .. import nomenclature


def matrixConstraint (parent='', child='', transforms=['translate', 'rotate', 'scale', 'shear']):

    """
    NOTE: matchTransform child to parent

    @param parent = str, give parent
    @param child = str, give child
    @param transforms = list, attributes to connect
    """


    prefix_multMatrix = nomenclature.prefix['multMatrix']
    prefix_decomposeMatrix = nomenclature.prefix['decomposeMatrix']


    # create node

    name_mmx = f'{prefix_multMatrix}_{child}'
    name_dmx = f'{prefix_decomposeMatrix}_{child}'

    mmx = cmds.createNode('multMatrix', n=name_mmx, ss=1)
    dmx = cmds.createNode('decomposeMatrix', n=name_dmx, ss=1)

    # connect nodes

    cmds.connectAttr(f'{parent}.worldMatrix[0]', f'{mmx}.matrixIn[0]')

    cmds.connectAttr(f'{mmx}.matrixSum', f'{dmx}.inputMatrix')

    for transform in transforms:

        if transform in ['translate', 'rotate', 'scale', 'shear']:
            cmds.connectAttr(f'{dmx}.output{transform.title()}', f'{child}.{transform}')

        else:
            cmds.connectAttr(f'{dmx}.output{transform[:1].title() + transform[1:]}', f'{child}.{transform}')

    cmds.connectAttr(f'{child}.parentInverseMatrix[0]', f'{mmx}.matrixIn[1]')


    if cmds.objectType(child) == "joint":

        # reset jointOrient
        for axis in ["X", "Y", "Z"]:
            cmds.setAttr(f"{child}.jointOrient{axis}", 0)

