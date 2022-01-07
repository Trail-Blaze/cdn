i=0
shopt -s extglob
THISSCRIPT=build.sh
FILE=build0.tar.gz
sudo apt-get install tar

function checkfile {
if [ -f "$FILE" ]; then
	echo "$FILE exists."
	i=$((i+1))
	FILE=build${i}.tar.gz
	checkfile

else
	clearName="build-latest.tar.gz"

if [ -f "$clearName" ]; then
	echo "[CREATE] Renaming old 'LATEST' build... to $FILE"
	mv build-latest.tar.gz ${FILE}
fi
	echo "[CREATE] Creating NEW 'LATEST' build..."
    tar -czvf build-latest.tar.gz build
	# rm -rfv ${THISSCRIPT}
	# rm -rfv build
	rm -rfv !(build*)

fi
}
checkfile
   
git add .
git commit -am "Build Files"
git fetch --all
git merge origin/build
git push origin build
