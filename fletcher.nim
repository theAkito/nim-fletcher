{.checks: off, optimization: speed.}
import
  fletcher/check

proc fletcher*(filename: string, bits: string = "16"): uint64 =
  ## User-friendly wrapper API for calculating
  ## the Fletcher checksum the easy way.
  ## First parameter equals to
  ## the file name of the file you want to open.
  ## Second parameter equals to
  ## the bit size of the Fletcher algorithm variation.
  ## Example:
  ##   let fileChecksum: uint64 = fletcher("myfile.bin", "16")
  case bits
  of "8", "eight", "8bit", "8-bit", "8b":
    return calChecksum(filename, i8)
  of "16", "sixteen", "16bit", "16-bit", "16b":
    return calChecksum(filename, i16)
  of "32", "thirtytwo", "32bit", "32-bit", "32b":
    return calChecksum(filename, i32)
  of "64", "sixtyfour", "64bit", "64-bit", "64b":
    return calChecksum(filename, i64)