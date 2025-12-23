import maya.cmds as cmds
import maya.mel as mel

import time


def build (meshTargets=['msh_captain_head_anim', 'msh_captain_eyebrow_L', 'msh_captain_eyebrow_R'], grpCTRL = 'GRP_CTRL_facial', prefix_set = 'SEL_'):


    startTime = time.time()


    print('MESH CONTROLLER CREATION :\n')

    sets = cmds.ls(f'{prefix_set}*')

    locators = []

    for set in sets:
        
        print('\n##########################################\n')
        print(f'Build with the set: {set}')


        ### Defines values ###

        # set childs
        items = cmds.ls(cmds.sets(set, q=1), fl=1)

        # faces for the controler
        faces = items

        # type of controler
        ctrlType = None

        if 'shape' in set or 'cluster' in set:
            ctrlType = 'ctrlShape'
        if 'joint' in set :
            ctrlType = 'ctrlJoint'

        print(f'Creating a {ctrlType}')
        
        # joints and
        joint = None

        for item in items:
            type = cmds.nodeType(item)

            if type == 'joint':
                joint = item

                index = items.index(joint)
                items.pop(index)

        if not joint:
            if ctrlType == 'ctrlJoint':
                cmds.error(f'Please add a joint in the set: {set}', n=1)
        
        # locator
        locator = None

        for item in items:
            shapes = cmds.listRelatives(item, s=1)
            if shapes :
                type = cmds.nodeType(shapes[0]) 

                if type == 'locator':
                    locator = item

                    index = items.index(locator)
                    items.pop(index)

        if not locator:
            cmds.error(f'Please add a locator in the set: {set}', n=1)


        # global name
        name = set.split(prefix_set)[1]

        # mesh base
        meshBase = faces[0].split('.f')[0]

        if not meshBase in meshTargets:

            splited = meshBase.split('_')
            rest = '_'.join(splited[0:3])

            for mesh in meshTargets:
                if mesh.startswith(rest):
                    meshBase = mesh
                    break
            
            if not meshBase in meshTargets:
                meshBase = meshTargets[0]

            print(f'Mesh base: {meshBase}')

        # side
        side = name.split('_')[-1]


        ########################
        
        if not cmds.objExists(f'CTRL_{name}'):

            ### CTRL hierarchy ###

            # create nodes hierarchy
            ctrl = cmds.duplicate(meshBase, n=f'CTRL_{name}')[0]
            cstr = cmds.createNode('transform', n=f'CSTR_{name}', ss=1)
            off = cmds.group(cstr, n=f'OFF_{name}')

            # unhide ctrl
            hidden = cmds.getAttr(f'{ctrl}.visibility')
            if hidden == False:
                cmds.setAttr(f'{ctrl}.visibility', 1)

            # delete controler faces
            ctrlFaces = [face.replace(meshBase, ctrl) for face in faces]
            ctrlFacesInv = [item for item in cmds.ls(f'{ctrl}.f[*]', fl=1) if item not in ctrlFaces]
            cmds.delete(ctrlFacesInv)

            # set ctrl pivot
            if ctrlType == 'ctrlJoint':
                pivot = cmds.xform(joint, q=1, rotatePivot=1, ws=1)
                cmds.xform(ctrl, rotatePivot=pivot, scalePivot=pivot)

            if ctrlType == 'ctrlShape':
                cmds.xform(ctrl, cp=1)

            # parent and position the hierarchy
            pivot = cmds.xform(ctrl, q=1, rotatePivot=1, ws=1)

            if ctrlType == 'ctrlJoint':
                coords = cmds.xform(joint, q=1, m=1, ws=1)
                cmds.xform(off, m=coords)

            if ctrlType == 'ctrlShape':
                cmds.matchTransform(off, ctrl)

            cmds.parent(ctrl, cstr)

            cmds.xform(ctrl, rotatePivot=pivot, scalePivot=pivot, ztp=1)

            # reset ctrl values to 0
            for attr in ['t', 'r', 's']:
                for axis in ['x', 'y', 'z']:
                    if attr == 's':
                        cmds.setAttr(f'{ctrl}.{attr}{axis}', 1)
                    else :
                        cmds.setAttr(f'{ctrl}.{attr}{axis}', 0)

            # scaleX -1 Rside
            if side == 'R':
                rotateY = cmds.getAttr(f'{off}.ry')
                newRoatateY = 180 - rotateY
                cmds.setAttr(f'{off}.ry', -newRoatateY)
                cmds.setAttr(f'{off}.sz', 1)

                cmds.setAttr(f'{off}.sx', -1)

                if ctrlType == 'ctrlShape':
                    cmds.setAttr(f'{off}.ry', 0)


            ### MORPH ###

            cmds.select([ctrl, meshBase])
            mel.eval('Morph;')

            morph = cmds.ls(typ='morph')
            for m in morph :
                if m.startswith('morph'):
                    morph = m
                    break

            cmds.setAttr(f'{morph}.morphSpace', 1)
            morphName = f'{name}_MORPH'
            cmds.rename(morph, morphName)

            print(f'Created morph: {morphName}')


            ### SETUP ###
            
            # uv pin
            if not locator in locators:
                vertex = get_closest_vertex(obj=locator, mesh=meshBase)
                uv = get_uv_from_vertex(vertexID = vertex)
                uvpin(mesh=meshBase, target=locator, uv=uv, name=f'UVpin_{name}')

                locators.append(locator)
            
            if ctrlType == 'ctrlJoint':
                for attr in ['t', 'r', 's']:
                    for axis in ['x', 'y', 'z']:
                        cmds.connectAttr(f'{ctrl}.{attr}{axis}', f'{joint}.{attr}{axis}')

            if ctrlType == 'ctrlShape':
                cmds.transformLimits(ctrl, ty=(-2, 2), ety=(1, 1), tx=(0, 0), etx=(1, 1), tz=(0, 0), etz=(1, 1))

            cmds.pointConstraint(locator, off, mo=1)

            print(f'locator PIN = {locator}')

            # cancel ctrl double transform
            multDiv = cmds.createNode('multiplyDivide', n=f'mulDiv_{name}', ss=1)
            cmds.setAttr(f'{multDiv}.input2', -1, -1, -1)
            cmds.connectAttr(f'{ctrl}.t', f'{multDiv}.input1')
            cmds.connectAttr(f'{multDiv}.output', f'{cstr}.t')
            
            # parent the controler
            if cmds.objExists(grpCTRL):
                cmds.parent(off, grpCTRL)

        else:

            if not locator in locators:
                locators.append(locator)

            print(f'The controler CTRL_{name} already exists:\nDo nothing')


    endTime = time.time()
    elapsedTime = endTime - startTime

    messsage = f'<font color=lightgreen> FACIAL builded in: <font> <font color=white> {elapsedTime} <font> <font color=lightgreen> s'
    cmds.inViewMessage(amg=messsage, pos='midCenter', fade=1, fadeInTime=200, fadeStayTime=5000, fadeOutTime=200)
    print(f'FACIAL builded in: {elapsedTime}s')

def get_closest_vertex(obj='', mesh=''):
        
    coords = cmds.xform(obj, q=1, t=1, ws=1)
    vertices = cmds.ls(mesh + '.vtx[*]', flatten=1)

    minDistance = float('inf')
    closestVertex = None

    for vertex in vertices:
        vertexPos = cmds.pointPosition(vertex, world=1)

        distance = sum((a - b) ** 2 for a, b in zip(coords, vertexPos)) ** 0.5
        if distance < minDistance:
            minDistance = distance
            closestVertex = vertex


    return closestVertex

def get_uv_from_vertex(vertexID):

    UVcoords = cmds.polyListComponentConversion(vertexID, fromVertex=1, toUV=1)
    selectedUVcomp = cmds.ls(UVcoords, flatten=1)

    UVpos = cmds.polyEditUV(selectedUVcomp[0], q=1)
    

    return UVpos

def uvpin(mesh='', target='', uv=[1.0, 1.0], name=''):
    
    shapes = cmds.listRelatives(mesh, shapes=True)

    uvpin = cmds.createNode('uvPin', n=f'PIN_{name}')

    # reset target values to 0
    for attr in ['t', 'r', 's']:
        for axis in ['x', 'y', 'z']:
            if attr == 's':
                cmds.setAttr(f'{target}.{attr}{axis}', 1)
            else :
                cmds.setAttr(f'{target}.{attr}{axis}', 0)

    # input
    cmds.connectAttr(f'{shapes[0]}.worldMesh[0]', f'{uvpin}.deformedGeometry', f=1)
    cmds.connectAttr(f'{shapes[0]}.outMesh', f'{uvpin}.originalGeometry', f=1)

    # outputcmds.connectAttr(f"{uvpin}.outputMatrix[0]", f"{target}.offsetParentMatrix", f=1)
    cmds.setAttr(f"{uvpin}.coordinate[0].coordinateU", uv[0])
    cmds.setAttr(f"{uvpin}.coordinate[0].coordinateV", uv[1])