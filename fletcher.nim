import
  fletcher/check

proc checksum*(filename: string, bits: string): uint64 =
  case bits
  of "8", "eight", "8bit", "8-bit", "8b":
    return calChecksum(filename, i8)
  of "16", "sixteen", "16bit", "16-bit", "16b":
    return calChecksum(filename, i16)
  of "32", "thirtytwo", "32bit", "32-bit", "32b":
    return calChecksum(filename, i32)
  of "64", "sixtyfour", "64bit", "64-bit", "64b":
    return calChecksum(filename, i64)