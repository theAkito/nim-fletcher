import
  parseutils,
  streams

# Parse proc for every Fletcher level by parameter
# Split by each 4 bit in binary sequence, then process with parseBin

var file: File

proc getAmount*(data: openArray[uint8] | openArray[uint16] | openArray[uint32]): uint64 =
  return data.len

proc prepBin*(file: File, bit: uint8): seq =
  #var
    #byteRiver
  case bit
  of 16:
    discard
  of 32:
    discard
  of 64:
    discard

discard """  
if open(file, "f16", fmRead, -1):
  var strm = newFileStream(file)
  var line = ""
  while strm.readLine(line):
    echo line
  strm.close()
"""

var bain: seq[uint8] # = @[1'u8] # 111'u8, 111'u8, 111'u8
newSeq(bain, 100)

#type myArray = array[0..100, uint8]
#var bain: myArray

discard file.open("f16", fmRead, -1)
echo readBytes(f = file, a = bain, start = 0, len = 100)
echo bain
#echo "f16".readFile()