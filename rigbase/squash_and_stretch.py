import maya.cmds as cmds
from .. import nomenclature


def squash_and_stretch (jointChain=[], ctrlChain = [], ctrlAttr = '', jointOrient='X'):
    
    """
    NOTE: /!/ check if jointOrient is set correctly or it will cause cycling /!/
          Late on updating the values

    @param jointChain = list, joints where to add squash and stretch
    @param ctrlChain = list, controlers of the  jointChain
    @param ctrlAttr = str, specifies on what controler to add the squash and strech attributes
    @param jointOrient = str, specifies the orientation of the joints
    
    @return str: None

    DO :
    add squash and stretch to a specified joint chain 
    """

    total_lenght = 0
    #store the original lenght of the chain

    for joint in jointChain[1:]:
        lenght = cmds.getAttr(f'{joint}.translate{jointOrient}')
        total_lenght= total_lenght + lenght
    

    prefix = nomenclature.prefix['floatConstant']
    restLenght = cmds.createNode("floatConstant", n=f'{prefix}_{jointChain[0]}.restLenght')

    cmds.setAttr(f'{restLenght}.inFloat', total_lenght, lock = 1)


    #get relative lenght
    adds = []
    for joint in jointChain[1:-1]:
        prefix = nomenclature.prefix["addDoubleLinear"]
        add = cmds.createNode("addDoubleLinear", n=f'{prefix}_{joint}')
        adds.append(add)
    

    for i in range(len(adds)):
        if i == 0:
            cmds.connectAttr(f'{jointChain[i+1]}.translate{jointOrient}', f'{adds[i]}.input1')
            cmds.connectAttr(f'{jointChain[i+2]}.translate{jointOrient}', f'{adds[i]}.input2')
        else:
            cmds.connectAttr(f'{adds[i-1]}.output', f'{adds[i]}.input1')
            cmds.connectAttr(f'{jointChain[i+2]}.translate{jointOrient}', f'{adds[i]}.input2')

    #calculate volume conservation
    prefix = nomenclature.prefix['floatMath']
    volPreserv = cmds.createNode('floatMath', n = f'{prefix}_volumePreserv_{jointChain[0]}')
    cmds.setAttr(f'{volPreserv}.operation', 3)
    cmds.connectAttr(f'{restLenght}.outFloat', f'{volPreserv}.floatA')
    cmds.connectAttr(f'{adds[-1]}.output', f'{volPreserv}.floatB')
    
    #create pairBlend
    prefix = nomenclature.prefix['pairBlend']
    pairBlend = cmds.createNode('pairBlend', n = f'{prefix}_sqSt_{jointChain[0]}')
    for axis in ["X", "Y", "Z"]:
        cmds.setAttr(f'{pairBlend}.inTranslate{axis}1', 1, lock = True)
        cmds.connectAttr(f'{volPreserv}.outFloat', f'{pairBlend}.inTranslate{axis}2')


    #create the cstr
    for ctrl in ctrlChain: 
        prefix = nomenclature.prefix['constraint']
        ctrlName = '_'.join(ctrl.split('_')[1:])
        cstr = cmds.group(ctrl, n= f'{prefix}_sqSt_{ctrlName}')
        for axis in ["X", "Y", "Z"]:
            if jointOrient == axis:
                pass
            else:
                cmds.connectAttr(f'{pairBlend}.outTranslate{axis}', f'{cstr}.scale{axis}')


    #add the switch
    cmds.select(ctrlAttr)
    cmds.addAttr(ln = "SquashandStretch", nn= "Squash and Stretch", min = 0, max = 10, dv = 0, keyable = True, at= 'float' )
    cmds.select(clear = True)
    prefix = nomenclature.prefix['floatMath']
    fmName = f'{prefix}_sqSt_normalize_{jointChain[0]}'
    attrMult = cmds.createNode("floatMath", n = fmName)
    cmds.connectAttr(f'{ctrlAttr}.SquashandStretch', f'{attrMult}.floatA')
    cmds.setAttr(f'{attrMult}.operation', 3)
    cmds.setAttr(f'{attrMult}.floatB', 10, lock = True)
    cmds.connectAttr(f'{attrMult}.outFloat', f'{pairBlend}.weight')



def stretch_spline (jntChain = [], curve = "", orientAxis = "X", ctrlAttr = ""):
    """
    NOTE:

    @param jointChain = list, joints where to add stretch
    @param curve = str, specifies the curve driving the spline Handle
    @param orientAxis = str, forward axis of the joints
    @param ctrlAttr = str, control on which to add the attribute for squash and stretch
    
    @return str: None

    DO : add strech to spline handle
    """

    # connect world space to curveInfo
    prefix = nomenclature.prefix['curveInfo']
    curveInfo = cmds.createNode("curveInfo", n = f'{prefix}_dynLength_{curve}')
    cmds.connectAttr(f'{curve}.worldSpace', f'{curveInfo}.inputCurve')
    arcLength = cmds.getAttr(f'{curveInfo}.arcLength')

    # store base lenght
    prefix = nomenclature.prefix['floatConstant']
    baseLenght = cmds.createNode ("floatConstant", n = f'{prefix}_baseLength_{curve}')
    cmds.setAttr(f'{baseLenght}.inFloat', arcLength, lock = True)

    # get the ratio 
    prefix = nomenclature.prefix['floatMath']
    multDiv = cmds.createNode("floatMath", n = f'{prefix}_stretchRatio_{curve}')
    cmds.setAttr(f'{multDiv}.operation', 3)
    cmds.connectAttr(f'{curveInfo}.arcLength', f'{multDiv}.floatA')
    cmds.connectAttr(f'{baseLenght}.outFloat', f'{multDiv}.floatB')

    # add to the base lenght of the jnt
    for jnt in jntChain:
        jntTranslate = cmds.getAttr(f'{jnt}.translate{orientAxis}')
        prefix = nomenclature.prefix['multDoubleLinear']
        mult = cmds.createNode("multDoubleLinear", n = f'{prefix}_stretch_for_{jnt}')
        cmds.setAttr(f'{mult}.input2', jntTranslate, lock = True)
        cmds.connectAttr(f'{multDiv}.outFloat', f'{mult}.input1')
        cmds.connectAttr(f'{mult}.output', f'{jnt}.translate{orientAxis}')

    if cmds.objExists(ctrlAttr):
        try:
            cmds.addAttr(f'{ctrlAttr}', ln = 'squashAndStretch', min = 0, max = 10, keyable = True, dv = 0, at = 'float')
            prefix = nomenclature.prefix['floatMath']
            switch = cmds.createNode("floatMath", n = f'{prefix}_switch_stretch_{curve}')
            cmds.setAttr(f'{switch}.floatB', 10, lock = True)
            cmds.setAttr(f'{switch}.operation', 3)
            cmds.connectAttr(f'{ctrlAttr}.squashAndStretch', f'{switch}.floatA')
            pb = cmds.createNode("pairBlend")
            cmds.connectAttr(f'{switch}.outFloat', f'{pb}.weight')
            cmds.connectAttr(f'{curveInfo}.arcLength', f'{pb}.inTranslateX2')
            cmds.connectAttr(f'{baseLenght}.outFloat', f'{pb}.inTranslateX1')
            cmds.connectAttr(f'{pb}.outTranslateX', f'{multDiv}.floatA', force = True)
        except: 
            pass
    else:
        pass 