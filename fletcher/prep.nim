import
  parseutils,
  streams

# Parse proc for every Fletcher level by parameter
# Split by each 4 bit in binary sequence, then process with parseBin

var file: File

proc getAmount*(data: openArray[uint8] | openArray[uint16] | openArray[uint32]): uint64 =
  return data.len

proc prepBin*(file: File, bit: uint8): seq =
  case bit
  of 16:
    discard
  of 32:
    discard
  of 64:
    discard
  
if open(file, "f16", fmRead, -1):
  var strm = newFileStream(file)
  var line = ""
  while strm.readLine(line):
    echo line
  strm.close()

discard file.open("f16", fmRead, -1)
#echo readBytes(f = file, len = 99999)
#echo file.readAll()