import
  f16,
  f32

echo "FLETCHER16"
echo "-abcde- checksum; should be 51440 = "
echo f16.fletcher([97.uint8, 98.uint8, 99.uint8, 100.uint8, 101.uint8], 5.uint) # correct = 51440
echo "-abcdef- checksum; should be 8279 = "
echo f16.fletcher([97.uint8, 98.uint8, 99.uint8, 100.uint8, 101.uint8, 102.uint8], 6.uint) # correct = 8279

echo "FLETCHER32"
echo "-abcde- checksum = "
echo fletcher([25185.uint16, 25699.uint16, 101.uint16], 3.uint64) # correct = 4031760169
echo "-abcde- checksum = "
echo fletcher([25185.uint16, 25699.uint16, 26213.uint16], 3.uint64) # correct = 1448095018

