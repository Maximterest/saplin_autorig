""" Initialize the main package """

from importlib import reload


# files

from . import nomenclature
reload(nomenclature)

from .import color_index
reload(color_index)

from . import template
reload(template)


# folders

from . import utils
reload(utils)

from . import tools
reload(tools)

from . import rig
reload(rig)

from . import rigbase
reload(rigbase)

from . import rigpresets
reload(rigpresets)

from . import ui
reload(ui)