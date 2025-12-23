""" Initialize rigpresets package """

# all sripts to construct preset rig


from importlib import reload


from . import captain
reload(captain)

from . import bill
reload(bill)

from . import facial
reload(facial)