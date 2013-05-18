#!/usr/bin/python

import sys
import urllib
import httplib
import hashlib

cadena = hashlib.sha1 (hashlib.md5 (sys.argv[1]).hexdigest ())
anedac = cadena.hexdigest()

print anedac[::-1]
