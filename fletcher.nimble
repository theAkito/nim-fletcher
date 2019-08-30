version     = "0.1.0"
author      = "Akito"
description = "Implementation of the Fletcher checksum algorithm."
license     = "GPLv3+"

requires "nim >= 0.20.0"

task manualtest, "Runs the manual test.":
  exec "nim cc -r tests/manualtest.nim"