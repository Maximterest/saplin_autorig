import maya.cmds as cmds


from . import modules

from ..utils import controlers
from ..utils import shapes


def build (
            assetName = '',
            scale = 1.0
            ):

    """
    NOTE: 

    @param assetName = str, name for the base group
    @param scale = float, custom scale reference for the rig
    """


    factorWOLRD = 50
    factorWALK = 39

    # create pipeline groups

    hooks = modules.main_groups_structure(assetName=assetName)


    # create main controlers

    targetGrp = cmds.listRelatives(modules.subGroups[0], c=1)

    worldHierarchy = controlers.controler_hierarchy(names=['WORLD'], parent=modules.subGroups[0], cstrGroup=False, scale=scale * factorWOLRD, shape="world", color="green")[0]
    walkHierarchy = controlers.controler_hierarchy(names=['WALK'], parent=worldHierarchy[-1], cstrGroup=False, scale=scale * factorWALK, shape="hexagon", color="yellow")[0]

    cmds.setAttr(worldHierarchy[-1] + '.lineWidth', 2)
    cmds.setAttr(walkHierarchy[-1] + '.lineWidth', 2)

    cmds.parent(targetGrp, walkHierarchy[-1])