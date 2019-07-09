#!/bin/bash
set -e
cd /debuild
cp /input/appsody-deb.tar .
mkdir ${CMD_NAME}-${VERSION}
cd ${CMD_NAME}-${VERSION}
tar -xvf ../appsody-deb.tar
mkdir tree
cd ./tree
cp /input/${CMD_NAME}.static .
#wget https://raw.githubusercontent.com/chilanti/mock-watcher/master/${CMD_NAME}-controller
wget ${CONTROLLER_BASE_URL}/${CMD_NAME}-controller
mv ${CMD_NAME}-controller ${CMD_NAME}-controller.static

cd ../debian
sed -i "s/PACKAGE_NAME/$CMD_NAME/g" control
sed -i "s/PACKAGE_NAME/$CMD_NAME/g" appsody.postrm
sed -i "s/PACKAGE_NAME/$CMD_NAME/g" appsody.postinst
sed -i "s/VERSION_NUMBER/$VERSION/g" changelog
#Here we could have additional sed commands, to make the package more generic
cd ..
debuild --no-tgz-check -d -uc -us -b --lintian-opts --profile debian
cd ..
cp *.deb /output
