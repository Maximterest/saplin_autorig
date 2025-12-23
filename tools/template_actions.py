import maya.cmds as cmds
import os

from .. import template

def reference (path='', namespace='TPL'):

    """
    @param path = str, give file path
    @param namespace = str, give custom namespace
    """


    nodes = ''

    if os.path.exists(path):
        nodes = cmds.file(path, reference=1, namespace=namespace , returnNewNodes=1)

        return nodes

    else :
        cmds.inViewMessage(amg=f"{path} can not be founded", pos="midCenter", fade=1)

def reference_delete (path=''):

    """
    @param path = str, give file path
    """


    cmds.file(path, rr=1)


def import_template (typ='biped', tpl=''):

    """
    NOTE : WIP for moment it only duplicate the wanted group,
    so it doesn't import all rig setup to help joints placement,
    if you import 'biped' 'biped' it just import all the scene and you will have the rig setup

    @param typ = str, precise type of rig, check valids args in utils/template.py
    @param tpl = str, precise the part of template you want to import, check valids args in utils/template.py
    """


    baseGroup = template.templates[typ][typ]
    group = template.templates[typ][tpl]
    path = template.templates[typ]['path']

    if typ == tpl :

        cmds.file(path, i=1)


    else :

        # create base group for templates
        if not cmds.ls(baseGroup) and typ != tpl:
            cmds.createNode('transform', n=baseGroup, ss=1)
        else:
            pass
        
        # reference template scene
        reference(path=path, namespace='TPL')


        # duplicate template you want
        if not cmds.ls(group):
            cmds.duplicate(f'TPL:{group}')
            
            if typ != tpl:
                cmds.parent(group, baseGroup)
            
        else:
            print(f'{tpl} template already exists')


        # delete referenced template scene
        reference_delete(path=path)