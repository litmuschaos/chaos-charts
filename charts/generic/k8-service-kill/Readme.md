# Remote namespace 
# This experiment help you to kill a micro service running on the k8 cluster
* Apply experiments for K8 - `kubectl apply -f experiments.yaml`
* Validate the experiments for k8 - `kubectl get chaosexperiments`
* Setup RBAC as admin mode - `kubectl apply -f rbac.yaml`
* Create pod Experiment - for health experiment   -`kubectl create -f engine-kiam.yaml`
* Validate experiment - `kubectl get pods -w`
* Validate logs - `kubectl logs -f <delete pod>`
* Clean up chaosexperiment -`kubectl delete -f engine.yaml`
* Clean up rbac  -`kubectl delete -f rbac.yaml`
