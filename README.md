# k8s-Operator
Folder to Install k8s Operator
Operator:

Install Steps...

* Install Go
 -> repo goi
* Install Python
 -> repo ans
* Install Kubernetes
 -> repo metascript
* Install kustomize
  -> Kustomize installs:

  -> GOBIN=$(pwd)/ GO111MODULE=on go get sigs.k8s.io/kustomize/kustomize/v3

* Install Operator-SDK:(Instead use the install.sh in this directory)

 -> Install from the Git Binary
   https://github.com/operator-framework/operator-sdk/releases

 -> Install with make

   $ go get -d github.com/operator-framework/operator-sdk
   $ cd $GOPATH/src/github.com/operator-framework/operator-sdk
   $ git checkout master
   $ make tidy
   $ make install

export PATH=$PATH:$(go env GOPATH)/bin

export GOPATH=$(go env GOPATH)

* Example operator1
mkdir -p $GOPATH/src/operators1 && cd $GOPATH/src/operators1

operator-sdk init
