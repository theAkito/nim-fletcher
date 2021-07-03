# Package

version     = "0.4.0"
author      = "Akito"
description = "Implementation of the Fletcher checksum algorithm."
license     = "GPLv3+"

# Dependencies

requires "nim >= 0.20.0"
skipDirs    = @["utils"]
skipFiles   = @["README.md"]


# Tasks

task intro, "Initialize project. Run only once at first pull.":
  exec "git submodule add https://github.com/theAkito/nim-tools.git tasks || true"
  exec "git submodule update --init --recursive"
  exec "git submodule update --recursive --remote"
  exec "nimble configure"
task configure, "Configure project. Run whenever you continue contributing to this project.":
  exec "git fetch --all"
  exec "nimble check"
  exec "nimble --silent refresh"
  exec "nimble install --accept --depsOnly"
  exec "git status"
task fbuild, "Build project.":
  exec """nim c \
            --define:danger \
            --opt:speed \
            --out:fletcher \
            fletcher
       """
task dbuild, "Debug Build project.":
  exec """nim c \
            --define:debug:true \
            --debuginfo:on \
            --out:fletcher_debug \
            fletcher
       """
task test, "Test project.":
  exec "nim c -r tests/test.nim"
task manualtest, "Runs the manual test.":
  exec "nim cc -r tests/manualtest.nim"
task makecfg, "Create nim.cfg for optimized builds.":
  exec "nim tasks/cfg_optimized.nims"
task clean, "Removes nim.cfg.":
  exec "nim tasks/cfg_clean.nims"