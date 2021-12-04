


fullfilename="$1"
filename="$(echo $fullfilename |awk -v 'FS=[/\.]' '{print $4}')"
filename="${filename:-$fullfilename}"

echo $filename


nvim_scripts_path="$HOME/.config/nvim/scripts"

if [[ ! -f "$fullfilename" ]];then
    #echo create
    mkdir figures > /dev/null 2>&1
    #echo "$nvim_scripts_path/template.svg"
    cp "$nvim_scripts_path/template.svg" "./figures/$filename.svg" > /dev/null 2>&1
    echo '<img src="./figures/'"$filename"'.svg" alt="'"$filename"'">'
fi

#echo "$filename" >/tmp/ink.log
inkscape "./figures/$filename.svg" /dev/null 2>&1 &


#cp "$HOME/Library/Python/3.9/lib/python/site-packages/inkscapefigures/template.svg" "./figures/$filename.svg" > /dev/null 2>&1
#
#inkscape "./figures/$filename.svg" > /dev/null 2>&1

#inkscape "./figures/$filename.svg" --export-area-page \
#    --export-dpi 300 \
#    --export-type=pdf \
#    --export-latex \
#    --export-filename "./figures/$filename.pdf" > /dev/null 2>&1
