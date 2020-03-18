#if [ ! -d './figure' ];then
#echo not exist
#mkdir figure
#fi
#if [ ! -f '$1' ];then
#scrot -s -z -e 'mv $f ./figure/tmp.screenshot'
#mv ./figure/tmp.screenshot $1
#fi

#echo $1
if [ ! -d './figure' ];then
echo not exist
mkdir figure
fi
if [ ! -f ./figure/$1.png ];then
scrot -s -z -e 'mv $f ./figure/tmp.screenshot'
mv ./figure/tmp.screenshot ./figure/$1.png
fi

