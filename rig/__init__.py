""" Initialize rig package """

# all scripts that assemblate rig parts, creation of rig modules

from importlib import reload


from . import limbs
reload(limbs)

from . import spine
reload(spine)

from . import data
reload(data)

from . import hand 
reload(hand)