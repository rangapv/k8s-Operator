
operator-sdk init --plugins=declarative-go.kubebuilder.io/v1--project-version=3


operator-sdk create api --group hello1 --version v1beta1 --kind Greeting

then u will have
  api/v1beta1/greeting_types.go
  controllers/greeting/greeting_controller.go
  controllers/greeting/greeting_controller_test.go
  make install
  make run

operator-sdk run
operator-sdk run bundle
