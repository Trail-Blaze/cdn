i=0

FILE=build0.tar.gz
function checkfile {
if [ -f "$FILE" ]; then
	echo "$FILE exists."
	i=$((i+1))
	checkfile

else
	echo "$FILE does not exist."
	tar -czvf build${i}.tar.gz build
	rm -rfv !("build${i}.tar.gz")

fi
}
         
git add .
git commit -am "Build Files"
git fetch --all
git merge origin/build
git push origin build
