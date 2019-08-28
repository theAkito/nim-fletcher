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

## Documentation
```bash
nim doc --project fletcher.nim
```
Creates documentation for the entire project.

## Examples
Arriving soon.

## TODO
* make Fletcher32+ independent of CPU architecture
* add optional Base64 encoding
* apply delay type optimization
* apply module substitution optimization
* import statement optimizations