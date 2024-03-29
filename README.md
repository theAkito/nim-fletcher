[![nimble](https://raw.githubusercontent.com/yglukhov/nimble-tag/master/nimble.png)](https://nimble.directory/pkg/fletcher)

[![Language](https://img.shields.io/badge/language-Nim-orange.svg?style=plastic)](https://nim-lang.org/)

[![Build Status](https://drone.akito.ooo/api/badges/Akito/nim-fletcher/status.svg)](https://drone.akito.ooo/Akito/nim-fletcher)

[![GitHub](https://img.shields.io/badge/license-GPL--3.0-informational?style=plastic)](https://www.gnu.org/licenses/gpl-3.0.txt)
[![Liberapay patrons](https://img.shields.io/liberapay/patrons/Akito?style=plastic)](https://liberapay.com/Akito/)

## What is this?

This is a Nim module that takes files as arguments and outputs their respective Fletcher checksum. The Fletcher checksum has a bit lower error detection reliability than for example the well known CRC-32 but it is generally a lot faster than for example CRC-32 as well as Adler-32. The project's goal is to provide a very fast checksum algorithm to be used on devices like the Raspberry Pi.

## Disclaimer

The project in general is considered **Work In Progress**. The most reliable variation is Fletcher16, as it is not dependent on the CPU architecture's endianness and the way the algorithm was implemented, is approved to work.
The Fletcher32's only weakness is its dependence on the CPU's endianness, which might affect the comparison of checksums between different CPU architectures on different machines, otherwise it is just as stable as Fletcher16.

#### Currently implemented variations
 - [ ] Fletcher8
 - [x] Fletcher16
 - [ ] Fletcher32
 - [ ] Fletcher64

## Tests
```bash
nimble test
```
Runs tests.

The visual test, where you can check the values yourself, is optional:
```bash
nimble manualtest
```

## Documentation
```bash
nim doc --project fletcher.nim
```
Creates documentation for the entire project.

## Examples
##### Choose your way of using the API.
```Nim
from fletcher import fletcher
let
  fileChecksum_1: uint64 = fletcher("myfile.bin", "16")
  fileChecksum_2 = "myfile.bin".fletcher("32b")
  fileChecksum_3: uint64 = fletcher(filename = "myfile.bin", bits = "sixtyfour")
  fileChecksum_4 = "myfile.bin".fletcher # the default is the 16-bit variation
```

##### Compare a variable amount of files to a source file by checksum.
```Nim
from fletcher import fletcherCompare
let
  fileComparison_1: bool = fletcherCompare(bits = "16", original = "path/to/source_file", filenames = "path/to/destfile1", "path/to/destfile2", "path/to/destfile3")
  fileComparison_2 = "16".fletcherCompare("path/to/source_file", "path/to/destfile1", "path/to/destfile2", "path/to/destfile3")
```

## Advanced
##### For testing purposes and development
```Bash
nimble configure
```
Creates a `nim.cfg` with optimizations as compilation arguments.

```Bash
nimble clean
```
Deletes the generated `nim.cfg`.

## TODO
* make Fletcher32+ independent of CPU architecture
* add optional Base64 encoding
* apply delay type optimization
* apply modulo substitution optimization
* checksum text
* ~~varargs file comparison~~
* ~~import statement optimizations~~
* ~~add documentation~~

## License
Copyright (C) 2020  Akito <the@akito.ooo>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.