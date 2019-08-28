proc fletcher*(data: openArray[uint32], tlength: uint64): uint64 =
  var
    c0: uint64 = 0
    c1: uint64 = 0
    h: uint32 = 0
    i: uint64 = 0
    j: uint64 = 0
    length: uint64 = tlength
  const
    buf: uint64 = 360
    fin: uint64 = 4_294_967_295'u64    
  while j.uint64 < length:
    c0 += data[h]
    h.inc
    c1 += c0
    j.inc
  c0 = c0 mod fin
  c1 = c1 mod fin
  return c1.uint shl 32 or c0.uint
