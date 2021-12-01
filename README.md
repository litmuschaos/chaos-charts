# Chaos-Charts
[![Slack Channel](https://img.shields.io/badge/Slack-Join-purple)](https://slack.litmuschaos.io)
![GitHub Workflow](https://github.com/litmuschaos/chaos-charts/actions/workflows/push.yml/badge.svg?branch=master)
[![Docker Pulls](https://img.shields.io/docker/pulls/litmuschaos/go-runner.svg)](https://hub.docker.com/r/litmuschaos/go-runner)
[![GitHub issues](https://img.shields.io/github/issues/litmuschaos/chaos-charts)](https://github.com/litmuschaos/chaos-charts/issues)
[![Twitter Follow](https://img.shields.io/twitter/follow/litmuschaos?style=social)](https://twitter.com/LitmusChaos)
[![YouTube Channel](https://img.shields.io/badge/YouTube-Subscribe-red)](https://www.youtube.com/channel/UCa57PMqmz_j0wnteRa9nCaw)
<br><br>

This repository hosts the Litmus Chaos Charts. A set of related chaos experiments are bundled into a Chaos Chart. Chaos Charts are classified into the following categories.

- [Generic Chaos](#generic-chaos)
- [Application Chaos](#application-chaos)
- [Platform Chaos](#platform-chaos)

### Generic Chaos 

Chaos actions that apply to generic Kubernetes resources are classified into this category. Following chaos experiments are supported under Generic Chaos Chart

<table>
    <tr>
        <th> Experiment Name </th>
        <th> Description </th>
        <th> Link </th>
    </tr>
    <tr>
        <td> Container Kill </td>
        <td> Kill one container in the application pod </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/container-kill"> container-kill </a></td>
    <tr>
    <tr>
        <td> Disk Fill </td>
        <td> Fill the Ephemeral Storage of the Pod </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/disk-fill"> disk-fill </a></td>
    <tr>
    <tr>
        <td> Docker Service Kill </td>
        <td> Kill docker service of the target node </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/docker-service-kill"> docker-service-kill </a></td>
    <tr>
    <tr>
        <td> Kubelet Service Kill </td>
        <td> Kill kubelet service of the target node </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/kubelet-service-kill"> kubelet-service-kill </a></td>
    <tr>
    <tr>
        <td> Node CPU Hog </td>
        <td> Stress the cpu of the target node </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/node-cpu-hog"> node-cpu-hog </a></td>
    <tr>
    <tr>
        <td> Node Drain </td>
        <td> Drain the target node </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/node-drain"> node-drain </a></td>
    <tr>
    <tr>
        <td> Node IO Stress </td>
        <td> Stress the IO of the target node </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/node-io-stress"> node-io-stress </a></td>
    <tr>
    <tr>
        <td> Node Memory Hog </td>
        <td> Stress the memory of the target node </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/node-memory-hog"> node-memory-hog </a></td>
    <tr>
    <tr>
        <td> Node Restart </td>
        <td> Restart the target node </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/node-restart"> node-restart </a></td>
    <tr>
    <tr>
        <td> Node Taint </td>
        <td> Taint the target node </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/node-taint"> node-taint </a></td>
    <tr>
    <tr>
        <td> Pod Autoscaler </td>
        <td> Scale the replicas of the target application </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/pod-autoscaler"> pod-autoscaler </a></td>
    <tr>
    <tr>
        <td> Pod CPU Hog </td>
        <td> Stress the CPU of the target pod </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/pod-cpu-hog"> pod-cpu-hog </a></td>
    <tr>
    <tr>
        <td> Pod Delete </td>
        <td> Delete the target pods </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/pod-delete"> pod-delete </a></td>
    <tr>
    <tr>
        <td> Pod DNS Spoof </td>
        <td> Spoof dns requests to desired target hostnames </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/pod-dns-spoof"> pod-dns-spoof </a></td>
    <tr>
    <tr>
        <td> Pod DNS Error </td>
        <td> Error the dns requests of the target pod </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/pod-dns-error"> pod-dns-error </a></td>
    <tr>
    <tr>
        <td> Pod IO Stress </td>
        <td> Stress the IO of the target pod </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/pod-io-stress"> pod-io-stress </a></td>
    <tr>
    <tr>
        <td> Pod Memory Hog </td>
        <td> Stress the memory of the target pod </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/pod-memory-hog"> pod-memory-hog </a></td>
    <tr>
    <tr>
        <td> Pod Network Latency </td>
        <td> Induce the network latency in target pod </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/pod-network-latency"> pod-network-latency </a></td>
    <tr>
    <tr>
        <td> Pod Network Corruption </td>
        <td> Induce the network packet corruption in target pod </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/pod-network-corruption"> pod-network-corruption </a></td>
    <tr>
    <tr>
        <td> Pod Network Duplication </td>
        <td> Induce the network packet duplication in target pod </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/pod-network-duplication"> pod-network-duplication </a></td>
    <tr>
    <tr>
        <td> Pod Network Loss </td>
        <td> Induce the network loss in target pod </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/pod-network-loss"> pod-network-loss </a></td>
    <tr>
    <tr>
        <td> Pod Network Partition </td>
        <td> Disrupt network connectivity to kubernetes pods </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/pod-network-partition"> pod-network-partition </a></td>
    <tr>
</table>

### Application Chaos

While Chaos Experiments under the Generic category offer the ability to induce chaos into Kubernetes resources, it is difficult to analyze and conclude if the chaos induced found a weakness in a given application. The application specific chaos experiments are built with some checks on *pre-conditions* and some expected outcomes after the chaos injection. The result of the chaos experiment is determined by matching the outcome with the expected outcome. 


<table>
    <tr>
        <th> Experiment Name </th>
        <th> Description </th>
        <th> Link </th>
    </tr>
    <tr>
        <td> OpenEBS Experiments </td>
        <td> Injects faults in OpenEBS tool </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/openebs"> OpenEBS experiments</a></td>
    <tr>
    <tr>
        <td> Kafka Experiments </td>
        <td> Inject faults in kafka application </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/kafka"> kafka experiments </a></td>
    <tr>
    <tr>
        <td> Cassandra Experiments </td>
        <td> Inject faults in cassandra application </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/cassandra"> cassandra experiments </a></td>
    <tr>
</table>

### Platform Chaos

Chaos experiments that inject chaos into the platform resources of Kubernetes are classified into this category. Management of platform resources vary significantly from each other, Chaos Charts may be maintained separately for each platform (For example, AWS, GCP, Azure, VMWare etc)

Following Platform Chaos experiments are available on ChaosHub

<table>
    <tr>
        <th> Experiment Name </th>
        <th> Description </th>
        <th> Link </th>
    </tr>
    <tr>
        <td> AWS Experiments </td>
        <td> AWS Platform specific chaos </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/kube-aws"> AWS Experiments </a></td>
    <tr>
    <tr>
        <td> Azure Experiments </td>
        <td> Azure Platform specific chaos </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/azure"> Azure Experiments </a></td>
    <tr>
    <tr>
        <td> GCP Experiments </td>
        <td> GCP Platform specific chaos </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/gcp"> GCP Experiments </a></td>
    <tr>
    <tr>
        <td> VMWare Experiments </td>
        <td> VMWare Platform specific chaos </td>
        <td> <a href="https://github.com/litmuschaos/chaos-charts/tree/master/charts/generic/vmware"> VMWare Experiments </a></td>
    <tr>
</table>


## Installation Steps for Chart Releases 

*Note: Supported from release 1.1.0*

- To install the chaos experiments from a specific chart for a given release, execute the following commands
with the desired `<release_version>`, `<chart_name>` & `<namespace>`

```bash
## downloads and unzips the released source
tar -zxvf <(curl -sL https://github.com/litmuschaos/chaos-charts/archive/<release_version>.tar.gz)

## installs the chaosexperiment resources 
find chaos-charts-<release_version> -name experiments.yaml | grep <chart-name> | xargs kubectl apply -n <namespace> -f
``` 
- For example, to install the *generic* experiment chart bundle for release *1.1.0*, in the *sock-shop* namespace, run:

```bash
tar -zxvf <(curl -sL https://github.com/litmuschaos/chaos-charts/archive/1.1.0.tar.gz)
find chaos-charts-1.1.0 -name experiments.yaml | grep generic | xargs kubectl apply -n sock-shop -f
```

- If you would like to install a specific experiment, replace the `experiments.yaml` in the above command with the relative 
path of the experiment manifest within the parent chart. For example, to install only the *pod-delete* experiment, run: 

```bash
find chaos-charts-1.1.0 -name experiment.yaml | grep 'generic/pod-delete' | xargs kubectl apply -n sock-shop -f
```


## License
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Flitmuschaos%2Fchaos-charts.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Flitmuschaos%2Fchaos-charts?ref=badge_large)