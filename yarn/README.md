# YARN

This is a Docker image appropriate for running YARN on Kuberenetes. It produces two main images:
* `yarn-master` - Runs a YARN resource manager and exposes a port for agent and a port for the WebUI.
* `yarn-agent`  - Runs a YARN node manager and connects to the YARN resources master via DNS name `yarn-master`.

