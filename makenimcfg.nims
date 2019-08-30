#!/usr/bin/env nim
mode = ScriptMode.Silent
switch("hints", "off")
"nim.cfg".writeFile("--define:release\n--define:danger\n--opt:speed\n--checks:off")