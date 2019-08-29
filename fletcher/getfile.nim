from streams import
  openFileStream,
  atEnd,
  readUint8

type
  ByteMode* = enum
    i8, i16, i32, i64
var
  size*: uint64 = 0

proc getFile*(filename: string, mode: ByteMode): seq[uint8] | seq[uint16] | seq[uint32] =
  case mode
  of i8:
    "8-bit variation not implemented.".quit
  of i16:
    var fmtData: seq[uint8]
    let filestream = openFileStream(filename)
    while not filestream.atEnd:
      fmtData.add(filestream.readUint8)
    for items in fmtData:
      size.inc
    return fmtData
  of i32:
    var fmtData: seq[uint16]
    let filestream = openFileStream(filename)
    discard
  of i64:
    var fmtData: seq[uint32]
    let filestream = openFileStream(filename)
    discard
