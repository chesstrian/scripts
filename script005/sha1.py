#!/usr/bin/env python

import sys
import hashlib

if len (sys.argv) == 2:
  print hashlib.sha1 (sys.argv[1]).hexdigest()
else:
  print "Usage:\n    " + sys.argv[0] + " arg\n"
