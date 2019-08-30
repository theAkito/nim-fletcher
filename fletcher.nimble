version     = "0.2.0"
author      = "Akito"
description = "Implementation of the Fletcher checksum algorithm."
license     = "GPLv3+"

requires "nim >= 0.20.0"

skipDirs    = @["utils"]

task manualtest, "Runs the manual test.":
  exec "nim cc -r tests/manualtest.nim"
task configure, "Creates nim.cfg for optimized builds.":
  exec "nim utils/makenimcfg.nims"
task clean, "Removes nim.cfg.":
  exec "nim utils/clean.nims"