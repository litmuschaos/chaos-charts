# This explain how you can execute the argo work flow, 
### Assumption is that you have installed the litmus - https://docs.litmuschaos.io/docs/getstarted/ 
### Assumption is that you have install argo work flow on this cluster - https://github.com/litmuschaos/chaos-workflows#getting-started 
### This execution will happen on your namespace and won't impact outside it
### Please ensure you have enough pods for this namespace
- Apply rbac for argo - `kubectl apply -f rbac-argo-service.yaml`
- Execute experiments for k8 - `argo submit workflow.yaml`


