proc fletcher*(data: openArray[uint16], tlength: uint64): uint64 =
  var
    c0: uint32 = 0
    c1: uint32 = 0
    h: uint32 = 0
    i: uint64 = 0
    j: uint64 = 0
    length: uint64 = tlength
  const
    buf: uint64 = 360
    fin: uint16 = 65535    
  while j.uint64 < length:
    c0 += data[h]
    h.inc
    c1 += c0
    j.inc
  c0 = c0 mod fin
  c1 = c1 mod fin
  return c1 shl 16 or c0
