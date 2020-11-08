output=rest_export.json
zipFile=/app/sandbox-data/smockin-to-import.zip

echo "[" > $output
firstMock=1
for f in *aws-service-*.json ; do 
    if [ -f $f ] ; then 
        echo "Adding mocks from: $f"
        if [ $firstMock -eq 0 ]; then
            echo "," >> $output
        else
            firstMock=0
        fi
        cat $f >> $output
    fi
done
echo "]" >> $output

rm -f $zipFile
if [ $firstMock -eq 0 ] ; then
    zip -v $zipFile rest_export.json
else 
    echo "Nothing to import"
fi
