#!/bin/bash
mkdir "tmp"
cd "tmp"

cp $1 "tmp.zip"

mkdir "tmp"
unzip -q "tmp.zip" -d "tmp"
rm -rf "tmp.zip"

cd "tmp"

"$DX" --dex --output="temp.dex" "classes.jar"
method_count="$( cat "temp.dex" | head -c 92 | tail -c 4 | hexdump -e '1/4 "%d\n"' )"

if [ -d "libs" ]; then
	cd 'libs'
	for file in *.jar ; do 
		"$DX" --dex --output="temp.dex" "$file"
		tmp_method_count="$( cat "temp.dex" | head -c 92 | tail -c 4 | hexdump -e '1/4 "%d\n"' )"
		let method_count=method_count+tmp_method_count
	done
fi

cd '../../../'
rm -rf "tmp"

echo "Methods count = $method_count"