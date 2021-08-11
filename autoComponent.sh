#!bin/sh
task /ql/scripts/code.sh
targetFile="/ql/config/task_before.sh"
echo "#!/usr/bin/env bash" > $targetFile
staticStr="/ql/scripts/appendStr.txt"
lastLog=`ls -t /ql/log/code/ | head -n 1`
staticStr="/ql/log/code/${lastLog} ${staticStr}"
array=($staticStr)
length=${#array[@]}
for ((i=0; i<$length; i++))
do
cat ${array[$i]} | while read FILE
do
        echo $FILE >> $targetFile
        echo "" >> $targetFile
done
done
