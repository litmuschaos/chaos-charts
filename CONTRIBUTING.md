# Contributing to Community Charts

Litmus Community-Charts is an Apache 2.0 Licensed project that uses the standard GitHub pull requests process to review and accept 
contributions. This repository is the canonical source for the chaos charts that appear on [hub.litmuschaos.io](https://hub.litmuschaos.io)

Chaos Charts are a groups of categorized chaos experiments, represented as custom resource definitions that can be executed by the 
[Litmus Chaos Operator](https://github.com/litmuschaos/chaos-operator). We would love to see your charts added to the list of community-charts. 

To get started, read on!

## How to Contribute a Chaos Chart

The creation of a chaos chart or subchart involves the following steps: 

- Creation of Litmusbooks
- Creation of Experiment CRs
- Creation of ChartServiceVersion Templates

These are briefly described below. 


### Litmusbooks

Litmusbooks are the execution units of the chaos experiments. They are Kubernetes Jobs running the test containers (mostly running ansible playbooks, 
but could be any other scripting/programming language as long as the input and output interfaces are satisfied!). The experiments typically
involve definition of the entry/exit(health) criteria, creation of library utils (reusable code tasks/code-blocks) and the experiment business logic.

A detailed guide for creation on ansible-based litmusbooks is provided in the [Litmusbook Cookbook](https://docs.litmuschaos.io/docs/next/cb-overview.html)

The Litmusbooks are maintained in the [Litmus](https://github.com/litmuschaos/litmus) repo. View the PR checklist for the litmusbooks [here](https://github.com/litmuschaos/litmus/blob/master/.github/PULL_REQUEST_TEMPLATE.md)

### Experiment Custom Resources

The experiment CRs are a custom/condensed representation of a litmusbook where ENVs and experiment execution info is specified. The experiment CRs 
help categorization (a chart can have subcharts), bundling & lighter/less cluttered interface for tuning by developers who can readily deploy a desired 
chaos profile in their deployment environments. The chaos experiments are used by the Litmus Chaos Operator to orchestrate the chaos. 

Here is an example custom resource for a random [pod-delete](https://github.com/litmuschaos/community-charts/blob/master/charts/kubernetes/state/experiments/pod-delete-exp.v0.1.0.yaml) experiment 

### ChartServiceVersion (CSV) Templates

The CSV specifies the metadata associated with the chart. A defined template (inspired by the CSV of Operator framework) is used to render this metadata 
information on the hub.litmuschaos.io. Each chart/subchart is accompanied by its respective CSV. Here is an example detailing the [Kubernetes](https://github.com/litmuschaos/community-charts/blob/master/charts/kubernetes/kubernetes.chartserviceversion.yaml) chaos chart.

The Package YAML is used to define the hierarchy/parent-child relationship of charts & subcharts. It is used to structure the pages on hub.litmuschaos.io.



