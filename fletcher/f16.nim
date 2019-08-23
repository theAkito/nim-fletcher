proc fletcher*(data: openArray[uint8], length: uint64): uint =
  var
    c0: uint32 = 0
    c1: uint32 = 0
    i: uint8 = 0
    h: uint = 0
    j: uint64 = 0
  const
    buf: uint64 = 5802
    
  while length >= buf:
    for i in countdown(length, 0, buf):
      while h < buf.uint32:
        c0 += data[h]
        h.inc
        c1 += c0
        h.inc
    c0 = c0 mod 255
    c1 = c1 mod 255
    
  while j < length:
    c0 += data[j]
    j.inc
    c1 += c0

  c0 = c0 mod 255
  c1 = c1 mod 255

  return c1 shl 8 or c0

#echo fletcher([97.uint8, 98.uint8, 99.uint8, 100.uint8, 101.uint8], 5.uint) # correct = 51440
#echo fletcher([97.uint8, 98.uint8, 99.uint8, 100.uint8, 101.uint8, 102.uint8], 6.uint) # correct = 8279