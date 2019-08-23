proc fletcher*(data: openArray[uint16], length: uint64): uint =
  var
    c0: uint32 = 0
    c1: uint32 = 0
    h: uint32 = 0
    j: uint64 = 0
  const
    buf: uint64 = 360
    fin: uint16 = 65535
    
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

  return c1 shl 16 or c0
