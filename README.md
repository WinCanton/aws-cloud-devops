# AWS Cloud-Devops
cloud devops scripts using aws web services.

# Architecture Diagram

<img src="infrastructure/QbVpc1.png">

The diagram above illustrates the architecture implemented by the CloudFormation code stored within the folder 'infrastructure'.

The architecture comprises of 4 different layers. Each layer is represented by a dedicated CloudFormation stack (and each stack can be created using provided bash script, YAML file and a param-file)

The 4 architectural layers (and the corresponding resources) are defined as follows:

- Layer-1: Subnets (Resources: Public and Private subnets, VPC)
- Layer-2: Internet (Resources: Internet Gateway and NAT Gateways)
- Layer-3: Security (Resources: Public and Private RouteTables)
- Layer-4: Servers (Resources: Load-Balancers, Server Launch Configurations).

For troubleshooting purposes, code for creating a Jumpbox CloudFormation stack is also provided.

To create the environment, the following commands can be used (in the exact order):

```bash
./script-create-stack.sh stack-subnet stack-subnet.yml param-subnet.json
./script-create-stack.sh stack-internet stack-internet.yml param-internet.json
./script-create-stack.sh stack-security stack-security.yml param-security.json
./script-create-instances.sh stack-server stack-server.yml param-server.json
```

Similarly, if needed, a jumpbox stack can be created:
```bash
./script-create-stack.sh stack-jumpbox stack-jumpbox.yml param-jumpbox.json
```

A number of utility scripts are also provided:
- `script-list-outputs.sh`  >> to list all outputs
- `script-list-stack-status.sh`  >> user friendly display of status of all running stacks
- `script-delete-stack.sh` >> to delete existing stack
- `script-validate.sh`  >> to validate a YAML template for any syntax or formatting error
