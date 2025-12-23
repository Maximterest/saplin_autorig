import maya.cmds as cmds 

def lock_attributes(toLock = [], 
                    tLock = [""],
                    rLock = [""], 
                    sLock = [""], 
                    customAttr = [""]):
    
    """
    Note: by default ALL attributes are locked
          if you want the transforms to not be locked just write t/r/sLock = []

    @param toLock = list, the nodes that need to have attributes locked
    @param tLock = list, axes of which you want to lock the translate
    @param rLock = list, axes of which you want to lock the rotate
    @param sLock = list, axes of which you want to lock the scale
    @param customAttr = list, other attributes you want to lock
    
    @return str: add your explication
    """


    for node in toLock:
        for axis in tLock:
            try: cmds.setAttr(f'{node}.t{axis}', lock = 1)
            except: pass
        for axis in rLock:
            try: cmds.setAttr(f'{node}.r{axis}', lock = 1)
            except: pass
        for axis in sLock:
            try: cmds.setAttr(f'{node}.s{axis}', lock = 1)
            except:pass
        for attr in customAttr:
            try: cmds.setAttr(f'{node}.{attr}', lock = 1)
            except: pass

def get_attributes(toGet = [], 
                   attributes = [], 
                   asString = False, 
                   keyable = False, 
                   lock = False, 
                   multiIndices = False, 
                   settable = False, 
                   type = False):
    
    """
    Note: by default NO attributes are returned 
          by default the definition assumes it is looking for the value of the attributes

    @param toGet = list, the nodes that need to have attributes locked
    @param attributes = list, attributes you want to get (no need to put the ".")
    @param asString = bool, whether you want the attribute value to be given as a string instead of an integer (only valid for enum attr)
    @param keyable = bool, if you want to get the keyability 
    
    @return str: add your explication

    DO : returns a list per specified nodes, containing the values for each of the attributes 
    """


    all_nodes_attributes = []

    for node in toGet:
        node_attributes  =[]
        for attr in attributes:
            value = cmds.getAttr(f'{node}.{attr}')
            node_attributes.append(value)

        all_nodes_attributes.append(node_attributes)

    return all_nodes_attributes

