import
  f16,
#  f32,
#  f64,
  getfile

proc calChecksum*(filename: string, mode: ByteMode): uint64 =
  case mode
  of i8:
    discard
  of i16:
    let
      gottenFile = getFile(filename, i16)
      checksum: uint64 = fletcher(gottenFile, size)
    return checksum
  of i32:
    discard
  of i64:
    discard

echo calChecksum("f16", i16)