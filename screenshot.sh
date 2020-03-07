if [ ! -d './figure' ];then
echo not exist
mkdir figure
fi
if [ ! -f '$1' ];then
scrot -s -e 'mv $f ./figure/tmp.screenshot'
mv ./figure/tmp.screenshot $1
fi

