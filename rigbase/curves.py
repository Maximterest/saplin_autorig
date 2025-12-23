import maya.cmds as cmds
import maya.mel as mel
from .. import nomenclature
from .. rigbase import ribbons
from .. utils import controlers

def make_curve_dynamic (curve = '', follicleParent = '', outputCurveParent = '', loc_base = ''):

    """
    NOTE: 

    @param curve = str, what curve do you want to make dynamic
    @param follicleParent = str, what do you want the follicle to be parented to 
    @param outputCurveParent = str, specify under which transform you want to parent the output curve
    @param loc_base =  str, object at the base of the curve
    
    @return str: [dynCurve, restCurve]

    DO :
    makes a curve dynamic
    """

    prefix = nomenclature.prefix['curve']
    #get name of the curve
    curveName = ("_").join(curve.split("_")[1:])
    restCurve = cmds.duplicate(curve, n= f'{prefix}_restPose_{curveName}')

    #make curve dynamic
    cmds.select(restCurve)
    mel.eval('makeCurvesDynamic 2 { "0", "0", "1", "1", "0"};')
    follicle = cmds.listRelatives(restCurve, p = 1)[0]
    follicleTrash = cmds.listRelatives(follicle, p = 1)[0]
    follicleShape = cmds.listRelatives(follicle, children = True)[0]

    #put follicle at the right position
        #unparent curve
    cmds.parent(restCurve, w = 1)
    for axis in ["X", "Y", "Z"]:
        cmds.setAttr(f'{restCurve[0]}.translate{axis}', lock = False)
        cmds.setAttr(f'{restCurve[0]}.rotate{axis}', lock = False)
        cmds.setAttr(f'{restCurve[0]}.scale{axis}', lock = False)

        #create CSTR for follicle
    prefix = nomenclature.prefix['constraint']
    cstr = cmds.group(em = 1, n = f'{prefix}_restPose_{curveName}')

    prefix = nomenclature.prefix['offset']
    off = cmds.group(em = 1, n = f'{prefix}_restPose_{curveName}')

        #move off to right position and parent
    cmds.matchTransform(off, loc_base)
    cmds.parent(cstr, off, r = True)
    cmds.parent(follicle, cstr, r = True)

    cmds.parent(restCurve, follicle)

    #put under given parent
    if follicleParent:
        try: 
            cmds.parent(off, follicleParent)
        except: 
            pass
    else:
        pass


    cmds.setAttr(f'{follicleShape}.pointLock', 1)

    dynCurveOrg = cmds.listConnections(f"{follicleShape}.outCurve")
    dynCurve = f'{nomenclature.prefix["curve"]}_dyn_{curveName}'
    
    cmds.rename(dynCurveOrg, dynCurve)

    if outputCurveParent:
        try: 
            outputCurveTrash = cmds.listRelatives(dynCurve, p = 1)[0]

            cmds.parent(dynCurve, outputCurveParent)
            cmds.delete(outputCurveTrash)
        except: pass
    else: 
        pass

    cmds.delete(follicleTrash)
    cmds.rename(follicle, f'{nomenclature.prefix["follicle"]}_restPose_{curveName}')

    toReturn = [restCurve[0], dynCurve]
    return toReturn 


def add_dyn_to_fk(curve = '', follicleParent = '', outputCurveParent = '', loc_base = '', ribbon = '', ctrlAttr = '', toConstraint = [], jntNumber = 10):

    """
    NOTE: add your text

    @param curve = str, what curve do you want to make dynamic
    @param follicleParent = str, what do you want the follicle to be parented to 
    @param outputCurveParent = str, specify under which transform you want to parent the output curve
    @param loc_base =  str, object at the base of the curve
    @param ribbon = str, ribbon that will tuen dynamic
    @param ctrlAttr = str, controller on which to add the switch
    @param toConstraint = list, controllers or cstrs on top of which will be added the cstrs for the dynamic curve
    @param jntNumber = int, number of joints to put on the ribbon 
    
    @return str: add your explication

    DO :
    add your text
    """
    curves = make_curve_dynamic(curve = curve, follicleParent=follicleParent, outputCurveParent= outputCurveParent, loc_base = loc_base)
    
    dynCurve = curves[1]
    ribbons.create_ribbon_on_surface(surface=ribbon, jntNumber=jntNumber, UVsMode=0, parent='', ctrls=[3, 'circle', 'lightBlue', 1.0], radius=1.0, cstrGroup=False)
    cmds.wire(ribbon, dynCurve, en = 1, dds = [(0, 10)])


    all_hierarchies = []
    #off and loc hierarchy
    for target in toConstraint:
        name = "_".join(target.split("_")[1:])

        locShape = cmds.createNode('locator')
        locTransform = cmds.listRelatives(locShape, p = 1)
        loc = cmds.rename(locTransform, f'{nomenclature.prefix["locator"]}_dyn_{name}')

        off = cmds.group(loc, n=f'{nomenclature.prefix["offset"]}_dyn_{name}')
        cmds.matchTransform(off, target)
        hierarchy = [off, loc]
        all_hierarchies.append(hierarchy)


    for i in range(len(toConstraint)):
        hierarchy = all_hierarchies[i]
        loc = hierarchy[-1]

        if i < len(toConstraint)-1:
            cmds.parent(all_hierarchies[i+1][0], loc)

    cstrs = controlers.add_cstr(controlers = toConstraint, nameComplement= "dyn")


    #SWITCH
    cmds.addAttr(ctrlAttr, ln = 'makeDynamic', min = 0, max = 10, keyable = True, dv = 0, at = 'float')
    facAttr = cmds.createNode('floatMath', n = f'{nomenclature.prefix["facAttr"]}_for_dyn_{ctrlAttr}')
    cmds.setAttr(f'{facAttr}.floatB', 10, lock = True)
    cmds.setAttr(f'{facAttr}.operation', 3, lock = True)
    cmds.connectAttr(f'{ctrlAttr}.makeDynamic', f'{facAttr}.floatA')

    
    for i in range(len(toConstraint)):
        loc = all_hierarchies[i][-1]
        cstr = cstrs[i]

        pb = cmds.createNode("pairBlend", n = f'{nomenclature.prefix["pairBlend"]}_for_dyn_{cstr}')
        cmds.connectAttr(f'{facAttr}.outFloat', f'{pb}.weight')

        for axis in ["X", "Y", "Z"]:
            cmds.connectAttr(f'{loc}.translate{axis}', f'{pb}.inTranslate{axis}2')
            cmds.connectAttr(f'{loc}.rotate{axis}', f'{pb}.inRotate{axis}2')
            cmds.connectAttr(f'{pb}.outTranslate{axis}', f'{cstr}.translate{axis}')
            cmds.connectAttr(f'{pb}.outRotate{axis}', f'{cstr}.rotate{axis}')
    