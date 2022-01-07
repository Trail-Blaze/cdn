i=0
shopt -s extglob
FILE=build0.tar.gz
sudo apt-get install tar

function checkfile {
if [ -f "$FILE" ]; then
	echo "$FILE exists."
	i=$((i+1))
	checkfile

else
	echo "$FILE does not exist."

	filename="build${i}.tar.gz"
    	tar -czvf ${filename} build
	rm -rfv !(${filename})

fi
}
checkfile
git add .
git commit -am "Build Files"
git fetch --all
git merge origin/build
git push origin build
