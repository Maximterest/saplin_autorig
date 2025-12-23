import maya.cmds as cmds
import maya.mel as mm

from ..tools import controler_shapes

from ..utils import controlers


def filter_shapes (obj=[]):

    """
    @param obj = list, object where to look for shapes

    @return list: shapes of the obj
    """


    shapes = []

    for item in obj:

        item_type = cmds.objectType( item )

        if item_type in ["objectSet"]:
            continue

        if item_type in ["transform", "joint"]:
            item_shapes = cmds.listRelatives( item, s=True, path=True )

            if item_shapes:
                shapes += item_shapes
        else:
            shapes.append( obj )


    return shapes

def shape_delete (obj=[]):
    
    """
    @param obj = list, obj to delete shapes
    """


    shapes = filter_shapes(obj)
    cmds.delete(shapes)

def shape_replace (childs=[], shape='circle', color='yellow', scale=[1, 1, 1]):

    """
    @param childs = list, give all object you want to replace shape
    @param shape = str, shape to apply on childs
    @param color = str, give a color to controlers
    @param scale = list, scale [X, Y, Z] of controlers
    """

    shape_delete(childs)
    shape_copy(childs=childs, shape=shape, color=color, scale=scale)

def shape_copy (childs=[], shape='circle', color='yellow', scale=[1, 1, 1]):

    """
    @param childs = list, give all object you want to replace shape
    @param shape = str, shape to apply on childs
    @param color = str, give a color to controlers
    @param scale = list, scale [X, Y, Z] of controlers
    """


    for child in childs:

        new = controler_shapes.create_curve(shape=shape, color=color, scale=scale)

        curve = new[0]
        curve_shape = new[1]

        cmds.parent(curve_shape, child, addObject=1, s=1)
        cmds.delete(curve)

        controlers.ctrl_color(ctrl=child, color=color)

        for s in curve_shape :
            cmds.rename(s, child + 'Shape')

def scale (obj='', scale=[1, 1, 1]):
  
    """
    @param obj = str, object with shape
    @param scale = list, scales to apply on the shape

    DO:
    multiple the existing scale of the obj by the new scale list
    """
    

    compmaskdr = {'mesh':'vtx', 'nurbsCurve':'cv', 'nurbsSurface':'cv', 'lattice':'pt'}
    shapenode = cmds.listRelatives(obj, s=1)[0]
    shapetype = cmds.nodeType(shapenode)
    compattr = compmaskdr[shapetype]

    componentsList = obj + '.%s[*]' % compattr
    
    rotationOffset=[0, 0, 0]
    pivotpos = [0, 0, 0]
    xformobj = obj
    if not 'transform' in cmds.nodeType(obj, inherited=1):
            xformobj = cmds.listRelatives(obj, p=1)[0]
    
    pivotpos = cmds.xform(xformobj, q=1, t=1, ws=1)


    cmds.scaleComponents(scale[0], scale[1], scale[2], componentsList, pivot=pivotpos, rotation=rotationOffset)

def rotate (obj='', rotate=[90, 0, 0]):

    """
    @param obj = str, object with shape
    @param rotate = list, rotates to apply on the shape
    """

    compmaskdr = {'mesh':'vtx', 'nurbsCurve':'cv', 'nurbsSurface':'cv', 'lattice':'pt'}

    shapenode = cmds.listRelatives(obj, s=1)
    if shapenode == None: shapenode = [obj]
    
    shapetype = cmds.nodeType(shapenode)
    compattr = compmaskdr[shapetype]

    componentsList = obj + '.%s[*]' % compattr

    cmds.xform(componentsList, ro=rotate, relative=1)

def mirrorCvPositions(cvs, mode='x', replaces=['_L', '_R']):
    
    '''
    NOTE: !!! WIP !!!

    mirror positions of CVs based on their names: flipping left to right and right to left
    
    @param cvs: list of CVs (usually taken using cmds.ls( sl=1, fl=1 )
    @type cvs: list(str), list of component string names
    @param mode: flip axis, "x" by default as PF creatures are facing Z+
    @type mode: str
    @param customPrefL: str, custom left prefix for example 'LT_Leg_Ctrl' would have 'LT_'
    @param customPrefR: str, custom Right prefix for example 'RT_Leg_Ctrl' would have 'RT_'
    @return: None
    '''

    
    for cv in cvs:
        
        pos = cmds.xform(cv, q = 1, ws = 1, t = 1)
        
        cvR = cv.replace(replaces[0], replaces[1])
        
        if mode == 'x': cmds.xform(cvR, ws = 1, t = [ pos[0] * ( -1 ), pos[1], pos[2] ])
        if mode == 'z': cmds.xform( cvR, ws = 1, t = [ pos[0], pos[1], pos[2] * ( -1 ) ] )
