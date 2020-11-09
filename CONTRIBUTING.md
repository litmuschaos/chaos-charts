# Contributing to ChaosHub

Litmus chaos-charts is an Apache 2.0 Licensed project that uses the standard GitHub pull requests process to review and accept 
contributions. This repository is the canonical source for the chaos charts that appear on [hub.litmuschaos.io](https://hub.litmuschaos.io)

Chaos Charts are a groups of categorized chaos experiments, represented as custom resource definitions that can be executed by the 
[Litmus Chaos Operator](https://github.com/litmuschaos/chaos-operator). We would love to see your charts added to the list of community-charts. 

## Categories In Charts

- <b>Generic</b>: It contains chaos to disrupt state of kubernetes resources. i.e, pod-delete
- <b>OpenEBS</b>: It contains chaos to disrupt state of OpenEBS control/date plane components. i.e, openebs-target-failure
- <b>Cassandra</b>: It contains chaos to disrupt state of Cassandra Applications. i.e, cassandra-pod-delete
- <b>Kafka</b>: It contains chaos to disrupt state of Kafka Applications. i.e, kafka-broker-pod-delete
- <b>Coredns</b>: It contains chaos to disrupt state of Coredns pod. i.e, coredns-pod-delete
- <b>Kube-AWS</b>: It contains chaos to disrupt state of AWS resources running part of the kubernetes cluster. i.e, ebs-loss
- <b>Kube-Components</b>: It contains chaos to disrupt the state of kubernetes components. i.e, k8-kube-proxy.

## Components/Files Of A Category
- <b>experiments.yaml</b>: It contains combined/concatenated experiments CRs present inside that category.
- <b><</b><b>category</b><b>>-chartserviceversion.yaml</b>: It contains all the metadata of the category, which is rendered in ChaosHub.
- <b><</b><b>category</b><b>>.package.yaml</b>: It contains list of all experiments present in that category.
- <b>icons</b>: `icons` directory contains category icon and icons of all experiments present inside that category. The name of the icon file should follow this `<exp-name>.png` convention.

## Components/Files Of A Experiment
- <b>engine.yaml</b>: It contains ChaosEngine CR manifest of the experiment.
- <b>experiment.yaml</b>: It contains ChaosExperiment CR manifest of the experiment.
- <b>rbac.yaml</b>: It contains RBAC(serviceAccount, Role/ClusterRole, RoleBinding/ClusterRoleBinding) manifest of the experiment.
- <b><</b><b>exp-name</b><b>>-chartserviceversion.yaml</b>: It contains all the metadata of the experiment, which is rendered in ChaosHub.


## Raising PR For New Experiment

- It should contains all the required file for experiment(engine.yaml, experiment.yaml, rbac.yaml, <exp-name>-chartserviceversion.yaml). For more details [refer](https://github.com/litmuschaos/chaos-charts/blob/master/CONTRIBUTING.md#componentsfiles-of-a-experiment).

- If the experiment belongs to an existing category then add an entry for the experiment in `<category.package.yaml>` and `<category.chartserviceversion.yaml>`. Add the icon for the experiment in `<category/icons>` directory. The name of the icon should be `<exp-name.png>`.

- If the experiment belongs to a new category then Create all the required files for the category and add the entries. For more details [refer](https://github.com/litmuschaos/chaos-charts/blob/master/CONTRIBUTING.md#componentsfiles-of-a-category)


<strong>Notes:</strong> The name of directories/files should follow the same naming convention prescribed above for [experiment](https://github.com/litmuschaos/chaos-charts/blob/master/CONTRIBUTING.md#componentsfiles-of-a-experiment) and [category](https://github.com/litmuschaos/chaos-charts/blob/master/CONTRIBUTING.md#componentsfiles-of-a-category).


To get started, refer to the [developer guide](https://github.com/litmuschaos/litmus-go/tree/master/contribute/developer-guide)
