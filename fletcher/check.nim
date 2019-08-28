import
  f16,
  f32,
  f64,
  getfile

proc calChecksum*(filename: string, mode: ByteMode): uint64 =
  case mode
  of i8:
    "8-bit variation not implemented.".quit
  of i16:
    let
      gottenFile = getFile(filename, i16)
      checksum: uint64 = fletcher(gottenFile, size)
    return checksum
  of i32:
    let
      gottenFile = getFile(filename, i32)
      checksum: uint64 = fletcher(gottenFile, size)
    return checksum
  of i64:
    let
      gottenFile = getFile(filename, i64)
      checksum: uint64 = fletcher(gottenFile, size)
    return checksum