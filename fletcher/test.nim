import
  f16,
  f32,
  f64

echo "FLETCHER16"
echo "-abcde- checksum; should be 51440 = "
echo f16.fletcher([97.uint8, 98.uint8, 99.uint8, 100.uint8, 101.uint8], 5.uint) # correct = 51440
echo "-abcdef- checksum; should be 8279 = "
echo f16.fletcher([97.uint8, 98.uint8, 99.uint8, 100.uint8, 101.uint8, 102.uint8], 6.uint) # correct = 8279
echo ""

echo "FLETCHER32"
echo "-abcde- checksum; should be 4031760169 = "
echo fletcher([25185.uint16, 25699.uint16, 101.uint16], 3.uint64) # correct = 4031760169
echo "-abcdef- checksum; should be 1448095018 = "
echo fletcher([25185.uint16, 25699.uint16, 26213.uint16], 3.uint64) # correct = 1448095018
echo ""

echo "FLETCHER64"
echo "-abcde- checksum; should be 14467467625952928454 = "
echo fletcher([1684234849.uint32, 101.uint32], 2.uint64) # correct = 14467467625952928454
echo "-abcdef- checksum; should be 14467579776138987718 = "
echo fletcher([1684234849.uint32, 26213.uint32], 2.uint64) # correct = 14467579776138987718
echo ""
