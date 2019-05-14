
echo "***************************Start Release...***************************\n"

cd ~/Desktop/Git/iOSDemo
#每次发版改newTag
newTag=0.2.3
git tag -d $newTag
git push origin :refs/tags/$newTag
git tag $newTag
git push --tags

echo "***************************Release End!!...***************************\n"



