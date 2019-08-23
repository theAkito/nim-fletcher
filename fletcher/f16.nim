proc fletcher*(tdata: seq[uint8], tlength: uint): uint =
  var
    c0: uint32 = 0
    c1: uint32 = 0
    data = tdata
    length = tlength
    i = 0
    h: uint = 0
    j = 0

  const
    buf: uint = 5802
    
  while length >= buf:
    for i in countdown(length, 0, 5802):
      while h < buf:
        data[h].inc
        c0 += data[h]
        c1 += c0
        h.inc
    c0 = c0 mod 255
    c1 = c1 mod 255

  for j in 0..<length:
    c0 = c0 + data[j]
    data[j].inc
    c1 = c1 + c0

  c0 = c0 mod 255
  c1 = c1 mod 255

  return c1 shl 8 or c0

# echo fletcher(@[97.uint8, 98.uint8, 99.uint8, 100.uint8, 101.uint8], 5.uint)