while read line
do
if echo $line | grep -q ^[0-9A-Za-z]
then
    echo $line
fi
done < white_list.txt

