#!/usr/bin/env python

import sys
import hashlib

print hashlib.sha1 (sys.argv[1]).hexdigest()
