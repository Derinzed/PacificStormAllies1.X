mkdir luatest

find . -iname "*.lua" | while read LINE; do
	luapc -o luatest/`basename $LINE`.lc $LINE 
done

rm -rf luatest