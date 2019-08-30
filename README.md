## What is this?

This is a Nim module that takes files as arguments and outputs their respective Fletcher checksum. The Fletcher checksum has a bit lower error detection reliability than for example the well known CRC-32 but it is generally a lot faster than for example CRC-32 as well as Adler-32. The project's goal is to provide a very fast checksum algorithm to be used on devices like the Raspberry Pi.

## Disclaimer

The project in general is considered Work In Progress. The most reliable variation is Fletcher16, as it is not dependent on the CPU architecture's endianness and the way the algorithm was implemented, is approved to work.
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
import fletcher
let fileChecksum_1: uint64 = fletcher("myfile.bin", "16")
let fileChecksum_2 = "myfile.bin".fletcher("32b")
let fileChecksum_3: uint64 = fletcher(filename = "myfile.bin", bits = "sixtyfour")
let fileChecksum_4 = "myfile.bin".fletcher # the default is the 16-bit variation
```

## TODO
* make Fletcher32+ independent of CPU architecture
* add optional Base64 encoding
* apply delay type optimization
* apply modulo substitution optimization
* ~~import statement optimizations~~
* ~~add documentation~~
* checksum text