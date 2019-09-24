# run demo

oc new-project pag-bluegreen --display-name="Blue/Green Deployment Pipeline Demo"
oc new-app jenkins-persistent --param MEMORY_LIMIT=1Gi --param VOLUME_CAPACITY=2Gi
oc new-app openshift/deployment-example:v1 --name=example-green
oc new-app openshift/deployment-example:v2 --name=example-blue
oc set triggers dc/example-green --remove-all
oc set triggers dc/example-blue --remove-all
oc expose svc/example-green --name=example
oc create -f https://raw.githubusercontent.com/fabianschyrer/pag-openshift-blue-green-example/master/example-pipeline.yaml