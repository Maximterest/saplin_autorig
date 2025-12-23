import maya.cmds as cmds


def create_loft_surface (name='', points=[], widthSize=4.0, spansNumber=2, parent=''):

    """
    @param name = str, surface name
    @param points = list, give 2 reference objects where to create the surface
    @param widthSize = float, give the size for the width
    @param spansNumber = int, give number of spans
    @param parent = str, parent where to group the surface

    @return str, surface name
    """

    
    tmpCurves = []

    for point in points :
        tmpCurve = cmds.curve(p=[(-widthSize/2, 0, 0), (widthSize/2, 0, 0)], d=1)
        cmds.matchTransform(tmpCurve, point)

        tmpCurves.append(tmpCurve)


    cmds.loft(tmpCurves, n=name, u=True, c=False, ar=1, ss=spansNumber+1, ch=False)
    cmds.delete(tmpCurves)

    if parent :
        cmds.parent(name, parent)
        
    cmds.select(d=1)


    return name