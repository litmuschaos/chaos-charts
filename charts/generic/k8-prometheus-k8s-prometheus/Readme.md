# Remote namespace 
* navigate to current directory `charts/generic/k8-prometheus-k8s-prometheus/`
* Apply experiments for K8 - `kubectl apply -f experiment.yaml`
* Validate the experiments for k8 - `kubectl get chaosexperiments`
* Setup RBAC as admin mode - `kubectl apply -f rbac-admin.yaml`
* Create pod Experiment - for health experiment   -`kubectl create -f engine.yaml`
* Validate experiment - `kubectl get pods -w`
* Validate logs - `kubectl logs -f <delete pod>`
* Clean up chaosexperiment -`kubectl delete -f engine.yaml`
* Clean up rbac-admin  -`kubectl delete -f rbac-admin.yaml`
