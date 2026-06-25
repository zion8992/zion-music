OUT="zionmusic.zip"

echo "Removing outdated versions..."
rm -f zionmusic.zip

echo "Validating mod config..."
if [ -f "mod.hjson" ]; then
	echo "Mod config found..."
else
	echo "[!] No 'mod.hjson' found!"
	exit
fi

count="$(find music -mindepth 1 -maxdepth 1 | wc -l)"
count="${count//[[:space:]]/}"
echo "--- Music: $count ---"
ls music/
sleep 0.8

echo "Compiling mod..."
zip -r $OUT mod.hjson icon.png music -x music/.DS_Store

echo "Mod Compiled to '$OUT'"
