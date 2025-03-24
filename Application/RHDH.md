# Red Hat Developer Hub

> A Backstage-based open enterprise platform for building [developer portals](https://www.redhat.com/en/topics/devops/what-is-an-internal-developer-platform) that visually consolidates elements of the development process

- [January 16, 2024 GA](https://www.redhat.com/en/about/press-releases/red-hat-developer-hub-now-generally-available)
- It is based on [BackStage.io](https://github.com/davidkhala/code-dev-collection/tree/main/backstage)

[Trial](https://www.redhat.com/en/technologies/cloud-computing/developer-hub/trial)

# Run

Requirement: one of

- Red Hat OCP
- AWS EKS
- Microsoft AKS

## Troubleshoot

- `Error starting machine: Error in driver during machine start: failed to start vm: Job failed with error code: 32788 ()`
  - Diagnose by `Start-VM -Name 'crc'`
