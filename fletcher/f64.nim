proc fletcher*(data: openArray[uint32], length: uint64): uint64 =
  var
    c0: uint64 = 0
    c1: uint64 = 0
    h: uint32 = 0
    j: uint64 = 0
  const
    buf: uint64 = 360
    fin: uint64 = 4_294_967_295'u64
    
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

  return c1.uint shl 32 or c0.uint
