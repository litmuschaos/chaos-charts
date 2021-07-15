# Pre-requisite

_In Namespace Changes_
- This experiment assume that you are using AWS with kubernetes 
- This experiment assume your namespace has right role for aws to make aws api calls 
- This experiment also assume you are using Instance group for your name space or aware that if you are using share node group, it will impact other pods running on this ec2 instance

# Procedure 

-  Apply experiments for k8 - `kubectl apply -f experiments.yaml`
-  Validate the experiments for k8 - `kubectl get chaosexperiment`
-  Setup RBAC - for pod delete RBAC - `kubectl apply -f rbac.yaml`
-  Create pod Experiment - for health experiment -`kubectl create -f engine.yaml`
-  Validate experiment - `kubectl get pods -o wide`
-  Validate logs - `kubectl logs -f <delete pod>`
-  Clean up chaosexperiment -`kubectl delete -f engine.yaml`
-  Clean up rbac  -`kubectl delete -f rbac.yaml`



