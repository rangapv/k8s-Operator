#!/bin/bash
set -E

source <(curl -s https://raw.githubusercontent.com/rangapv/bash-source/main/s1.sh) >>/dev/null 2>&1


verifykey() {

step1=`gpg --keyserver keyserver.ubuntu.com --recv-keys 052996E2A20B5C7E`
step1s="$?"
step2=`curl -LO ${NEWURL}/checksums.txt`
step2s="$?"
step3=`curl -LO ${NEWURL}/checksums.txt.asc`
step3s="$?"
step4=`gpg -u "Operator SDK (release) <cncf-operator-sdk@cncf.io>" --verify checksums.txt.asc`
step4s="$?"
step5=`grep operator-sdk_${os2}_${ARCH} checksums.txt | sha256sum -c -`
step5s="$?"

step6=`echo "$step5" | awk '{split($0,a,":"); print a[2]}'`

if [[ $step6 = " OK" ]]
then
	chmod +x operator-sdk_${os2}_${ARCH} && sudo mv operator-sdk_${os2}_${ARCH} /usr/local/bin/operator-sdk
fi

}

githubrelease () {

OPEURL="https://github.com/operator-framework/operator-sdk/releases/download/v"

echo "*****"
echo "This script install the default operator verion 1.12.0 from github, if you want o over-ride it the execute the script with ur version"
echo "./install.sh 1.x.x"
echo "*****"

if [[ ( "$#" -eq 0 ) ]]
then
	verop="1.12.0"
else
	verop="$1"
fi
NEWURL="$OPEURL$verop"

dlope=`curl -LO ${NEWURL}/operator-sdk_${os2}_${ARCH}`
dlopes="$?"
if [[ ( $dlopes -eq 0 ) ]]
then
verifykey
fi
}

githubrelease
