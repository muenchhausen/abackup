source backup.cfg
 
mkdir -p $sourcefolder $destfolder $logfolder

echo test1 > $sourcefolder/test1.txt
echo test2 > $sourcefolder/test2.txt

./abackup.sh run

rm -rf $sourcefolder $destfolder $logfolder
