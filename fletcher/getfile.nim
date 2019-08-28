import
  streams

#type
#  ByteMode = set[uint8]
type
  ByteMode* = enum
    i8, i16, i32, i64
var
  fmtData: seq[uint8]
  size*: uint64 = 0

proc getFile*(filename: string, mode: ByteMode): seq[uint8] =
  case mode
  of i8:
    "8-bit version not implemented.".quit
  of i16:
    let filestream = openFileStream(filename)
    while not filestream.atEnd:
      fmtData.add(filestream.readUint8)
    for items in fmtData:
      size.inc
    return fmtData
  else:
    discard
