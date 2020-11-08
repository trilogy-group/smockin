sh -c 'sleep 30; /app/create_import_archive.sh ; /app/import_smockin.sh' &

cd /app/smockin
./run.sh -CONSOLE
