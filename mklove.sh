date "+Compiled: %Y/%m/%d %H:%M:%S" > version.txt
rm ../FullInputTester-11.5.love
zip -9 -r -x\.git/* ../FullInputTester-11.5.love .
