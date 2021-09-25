
operator-sdk init --plugins helm --domain rangapv --group demo --version v1alpha1 --kind Nginx

make docker-build docker-push

vi Makefile
#IMG ?= controller:latest
IMG ?= $(IMAGE_TAG_BASE):$(VERSION)

make docker-build docker-push

operator-sdk olm install

make bundle bundle-build bundle-push

operator-sdk run bundle rangapv/helm1-bundle:v0.0.1


Then Create the Resource itself....

kubectl apply -f config/samples/demo_v1alpha1_nginx.yaml

$ kubectl get deployment
NAME           READY   UP-TO-DATE   AVAILABLE   AGE
nginx-sample   2/2     2            2           2m13s

$ kubectl get pods
NAME                                                   READY   STATUS    RESTARTS   AGE
nginx-sample-c786bfdcf-4g6md                           1/1     Running   0          81s
nginx-sample-c786bfdcf-6bhmx                           1/1     Running   0          81s

$ kubectl get service
NAME                                      TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)    AGE
nginx-sample                              ClusterIP   10.96.26.3   <none>        8080/TCP   1m


CleanUp:

kubectl delete -f config/samples/demo_v1alpha1_nginx.yaml

make undeploy
  
