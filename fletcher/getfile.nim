from streams import
  openFileStream,
  atEnd,
  readUint8

type
  ByteMode* = enum
    ## Defines which Fletcher algorithm variation to use.
    i8, i16, i32, i64
var

  size*: uint64 = 0  ## Size of the sequence representing the input file. Provides 1 of the 2 parameters needed for the Fletcher algorithm.

proc getFile*(filename: string, mode: ByteMode): seq[uint8] | seq[uint16] | seq[uint32] =
  ## Reads input file byte by byte. Sorts bytes, when needed, according to the needs of
  ## the respective Fletcher algorithm variation into a sequence.
  ## Returns this sorted sequence which shall be used as an input by
  ## the fletcher procs.
  ## Provides 1 of the 2 parameters needed for the Fletcher algorithm.
  case mode
  of i8:
    "8-bit variation not implemented.".quit
  of i16:
    var fmtData: seq[uint8]
    let filestream = openFileStream(filename)
    while not filestream.atEnd:
      fmtData.add(filestream.readUint8)
    size = fmtData.len.uint64
    return fmtData
  of i32:
    var fmtData: seq[uint16]
    let filestream = openFileStream(filename)
    if system.cpuEndian == littleEndian:
      discard
    elif system.cpuEndian == bigEndian:
      discard
  of i64:
    var fmtData: seq[uint32]
    let filestream = openFileStream(filename)
    if system.cpuEndian == littleEndian:
      discard
    elif system.cpuEndian == bigEndian:
      discard
