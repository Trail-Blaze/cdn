i=0
shopt -s extglob
THISSCRIPT=buildCheck_dev.sh
FILE=build_win-dev0.tar.gz
sudo apt-get install tar

function checkfile {
if [ -f "$FILE" ]; then
	echo "$FILE exists."
	i=$((i+1))
	FILE=build_win-dev${i}.tar.gz
	checkfile

else
	clearName="build_win-dev-latest.tar.gz"

if [ -f "$clearName" ]; then
	echo "[CREATE] Renaming old 'LATEST' build... to $FILE"
	mv ${clearName} ${FILE}
fi
	echo "[CREATE] Creating NEW 'LATEST' build..."
    tar -czvf ${clearName} build
	rm -rfv ${THISSCRIPT}
	rm -rfv build
	rm -rfv !(build*)
	echo "# Build Branch" > README.md

fi
}
checkfile
    
git add .
git commit -am "Build Files"
git fetch --all
git merge origin/build
git push origin build
