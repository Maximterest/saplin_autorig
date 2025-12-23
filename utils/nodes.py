import maya.cmds as cmds

from .. import nomenclature


def create_facAttr (parent='', parentAttr='', value=0.1):

    """
    NOTE: facAttr will be created after each custom attribute to make easier the lisibility in the nodeEditor

    @param parent = str, parent node
    @param parenAttr = str, parent attribute to connect the facAttr with
    @param value = float, value of input2
    
    @return str: facAttr name
    """


    prefix = nomenclature.prefix['facAttr']

    parentAttr_big = parentAttr.split('_')
    parentAttr_big = '_'.join(parentAttr_big[0:2]) + '_' + '_'.join(parentAttr_big[2::]).upper()

    name = f'{prefix}_for_{parentAttr_big}'

    facAttr = cmds.createNode('multDoubleLinear', n=name, ss=1)
    cmds.connectAttr(f'{parent}.{parentAttr}', f'{facAttr}.input1')

    # custom facAttr node
    cmds.setAttr(f'{facAttr}.input2', value, lock=1)

    return facAttr