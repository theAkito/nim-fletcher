import parseutils, streams

# Parse proc for every Fletcher level by parameter
# Split by each 4 bit in binary sequence, then process with parseBin

#proc convertBin*

var file: File

if open(file, "f16", fmRead, -1):
  var strm = newFileStream(file)
  var line = ""
  while strm.readLine(line):
    echo line
  strm.close()

discard file.open("f16", fmRead, -1)
#echo readBytes(f = file, len = 99999)
echo file.readAll()