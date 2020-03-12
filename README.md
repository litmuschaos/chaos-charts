# Chaos-Charts
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Flitmuschaos%2Fchaos-charts.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Flitmuschaos%2Fchaos-charts?ref=badge_shield)

This repository hosts the Litmus Chaos Charts.

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