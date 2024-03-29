import
  fletcher/f16,
  fletcher/f32,
  fletcher/f64,
  fletcher/getfile,
  fletcher

let
  f16a = fletcher([97.uint8, 98.uint8, 99.uint8, 100.uint8, 101.uint8], 5.uint) # correct = 51440
  f16b = fletcher([97.uint8, 98.uint8, 99.uint8, 100.uint8, 101.uint8, 102.uint8], 6.uint) # correct = 8279
  f16c = fletcher(getFile("tests/testbin", i16), size) # correct 37140
  f32a = fletcher([25185.uint16, 25699.uint16, 101.uint16], 3.uint64) # correct = 4031760169
  f32b = fletcher([25185.uint16, 25699.uint16, 26213.uint16], 3.uint64) # correct = 1448095018
  f64a = fletcher([1684234849.uint32, 101.uint32], 2.uint64) # correct = 14467467625952928454
  f64b = fletcher([1684234849.uint32, 26213.uint32], 2.uint64) # correct = 14467579776138987718

assert f16a == 51440
assert f16b == 8279
assert f16c == 37140
assert f32a == 4031760169'u64
assert f32b == 1448095018
assert f64a == 14467467625952928454'u64
assert f64b == 14467579776138987718'u64

# 16
assert fletcher("tests/testbin") == fletcher("tests/testbin1")
assert fletcher("tests/testbin") == fletcher("tests/testbin2")
assert fletcher("tests/testbin") == fletcher("tests/testbin3")
assert fletcherCompare("16", "tests/testbin", "tests/testbin1").allSuccess() == true
assert fletcherCompare(bits = "16", original = "tests/testbin", filenames = "tests/testbin1", "tests/testbin2").allSuccess() == true
assert fletcherCompare(bits = "16", original = "tests/testbin", filenames = "tests/testbin1", "tests/testbin2", "tests/testbin3").allSuccess() == true
assert fletcherCompare(bits = "16", original = "tests/testbin", filenames = "tests/testbin1", "tests/testbin2", "tests/testbin-false").allSuccess() == false
assert fletcherCompare(bits = "16", original = "tests/testbin", filenames = "tests/testbin1", "tests/testbin2", "tests/testbin-false", "tests/testbin3").allSuccess() == false