{.optimization: speed.}
import
  fletcher/check,
  tables

func allSuccess*(filenameToChecksum: Table[string, bool]): bool =
  result = true
  for success in filenameToChecksum.values:
    if success == false:
      return false

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

proc fletcherCompare*(bits: string = "16", original: string, filenames: varargs[string]): Table[string, bool] =
  ## Compares variable amount of files to a source file,
  ## by computing the fletcher checksum for the first file
  ## and then comparing the first checksum to each other
  ## file's checksum, respectively.
  ## Returns filename to bool of success.
  case bits
  of "8", "eight", "8bit", "8-bit", "8b":
    discard
  of "16", "sixteen", "16bit", "16-bit", "16b":
    var
      fletcherResponse: uint64
      compTable: Table[string, uint64]
      originalChecksum = fletcher(original)
    for filename in filenames:
      fletcherResponse = calChecksum(filename, i16)
      compTable[filename] = fletcherResponse
    for filename, checksum in compTable:
      try:
        doAssert originalChecksum == compTable[filename]
        result[filename] = true
      except AssertionDefect:
        result[filename] = false
        continue
      except ValueError:
        "Wrong type of value passed.".quit
  of "32", "thirtytwo", "32bit", "32-bit", "32b":
    discard
  of "64", "sixtyfour", "64bit", "64-bit", "64b":
    discard
