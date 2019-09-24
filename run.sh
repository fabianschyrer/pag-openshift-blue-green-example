# run demo

sudo oc new-project pag-bluegreen --display-name="Blue/Green Deployment Pipeline Demo"
sudo oc new-app jenkins-persistent --param MEMORY_LIMIT=1Gi --param VOLUME_CAPACITY=2Gi
sudo oc new-app openshift/deployment-example:v1 --name=example-green
sudo oc new-app openshift/deployment-example:v2 --name=example-blue
sudo oc set triggers dc/example-green --remove-all
sudo oc set triggers dc/example-blue --remove-all
sudo oc expose svc/example-green --name=example
sudo oc create -f https://raw.githubusercontent.com/fabianschyrer/pag-openshift-blue-green-example/master/example-pipeline.yaml