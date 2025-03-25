# Red Hat Developer Hub

> A Backstage-based open enterprise platform for building [developer portals](https://www.redhat.com/en/topics/devops/what-is-an-internal-developer-platform) that visually consolidates elements of the development process

- [January 16, 2024 GA](https://www.redhat.com/en/about/press-releases/red-hat-developer-hub-now-generally-available)
- It is based on [BackStage.io](https://github.com/davidkhala/code-dev-collection/tree/main/backstage)

[Trial](https://www.redhat.com/en/technologies/cloud-computing/developer-hub/trial)
- [Current trial](https://www.redhat.com/en/technologies/cloud-computing/developer-hub/trial?trialid=660571f9dd2d8b4573277ad1&bypass=0)
# Run
[On Red Hat OCP](https://docs.redhat.com/en/documentation/red_hat_developer_hub/latest/html/installing_red_hat_developer_hub_on_openshift_container_platform/assembly-install-rhdh-ocp-operator)
- Install Operator
  - In the **Administrator** perspective of the OpenShift Container Platform web console, click **Operators > OperatorHub**.
  - On the **Red Hat Developer Hub** Operator page, click [Install].
- Deploy
  1. Select/Create a project. e.g. `my-rhdh-project`
  2. From the **Developer** perspective on the OpenShift Container Platform web console, click **+Add** and Select project `my-rhdh-project`
  3. In **Developer Catalog** panel, click **Operator Backed**.
- Verification
  - Wait until pod status become **Active**
  - From the **Topology** view, click the **Open URL** icon on the Developer Hub pod.

on AWS EKS

on Microsoft AKS

## Troubleshoot

- `Error starting machine: Error in driver during machine start: failed to start vm: Job failed with error code: 32788 ()`
  - Diagnose by `Start-VM -Name 'crc'`
