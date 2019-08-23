proc fletcher*(data: openArray[uint8], length: uint64): uint =
  var
    c0: uint32 = 0
    c1: uint32 = 0
    h: uint32 = 0
    j: uint64 = 0
  const
    buf: uint64 = 5802
    fin: uint8 = 255
    
  while length >= buf:
    for i in countdown(length, 0, buf):
      while h < buf.uint32:
        c0 += data[h]
        h.inc
        c1 += c0
    c0 = c0 mod fin
    c1 = c1 mod fin
    
  while j < length:
    c0 += data[j]
    j.inc
    c1 += c0

  c0 = c0 mod fin
  c1 = c1 mod fin

  return c1 shl 8 or c0


echo "-abcde- checksum; should be 51440 = "
echo fletcher([97.uint8, 98.uint8, 99.uint8, 100.uint8, 101.uint8], 5.uint) # correct = 51440
echo "-abcdef- checksum; should be 8279 = "
echo fletcher([97.uint8, 98.uint8, 99.uint8, 100.uint8, 101.uint8, 102.uint8], 6.uint) # correct = 8279
