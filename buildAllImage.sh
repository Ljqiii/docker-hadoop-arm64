set -x

BASE_PATH=`pwd`


chmod +x  $BASE_PATHbase/buildimage.sh
chmod +x  $BASE_PATHdatanode/buildimage.sh
chmod +x  $BASE_PATHhistoryserver/buildimage.sh
chmod +x  $BASE_PATHnamenode/buildimage.sh
chmod +x  $BASE_PATHnodemanager/buildimage.sh
chmod +x  $BASE_PATHresourcemanager/buildimage.sh
chmod +x  $BASE_PATHsubmit/buildimage.sh



cd $BASE_PATH/base
./buildimage.sh

cd $BASE_PATH/datanode
./buildimage.sh

cd $BASE_PATH/historyserver
./buildimage.sh

cd $BASE_PATH/namenode
./buildimage.sh

cd $BASE_PATH/nodemanager
./buildimage.sh

cd $BASE_PATH/resourcemanager
./buildimage.sh

cd $BASE_PATH/submit
./buildimage.sh
