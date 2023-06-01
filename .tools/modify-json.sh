#!/bin/bash
if [ -z $1 ];then
    echo "need json directory,for example 'modify-json.sh ./repos/deepin-community'"
    exit -1
fi

#cd $1
#for f in $(grep "workflow-templates\/call-build-deb.yml" -nri |awk '{print $1}')
#do
#    #echo "f: $f"
#    filename=$(echo $f | awk -F ':' '{print $1}')
#    line=$(echo $f | awk -F ':' '{print $2}')
#    #newline=$(echo -n $line)
#    #echo "filename: $filename"
#    #echo "line: $line"
#    #echo "$filenemae ***** $line ****** $newline"
#    startline=$(echo "$line-4"|bc)
#    endline=$(echo "$line+2"|bc)
#    #echo "startline: $startline"
#    #echo $endline
#    #sed -i "${startline},${endline}d" $filename
#    sed -i "$line r call-deb.file" $filename > $filename
#done

for f in $(ls $1/)
do
    sed -i '/workflow-templates\/call-build-deb.yml/ r delete-call-build-deb.file' $1/$f
    sed -i '/workflow-templates\/call-tag-build.yml/ r delete-call-tag-build.file' $1/$f
done
