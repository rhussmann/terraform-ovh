# terraform-ovh
A set of terraform scripts for generating an [OVH](https://ovh.com) public cloud server.

## Prerequisites
* [Terraform](https://www.terraform.io/)

## Overview
These scripts create a server

## Setup
First, you'll need an [OVH](https://ovh.com) account setup and ready to go.

Second, you'll need to ask the OVH folks to enable an OpenStack user for you. When I obtained my account I attempted to create one. Apparently it requires tech support intervention.

Once you have the OVH OpenStack user created, you can download an `openrc.sh` file to initialize your OpenStack environment variables.

Before running any terraform commands, I run
```
source openrc.sh
```
Enter the OpenStack user password provided from OVH to populate the environment variables appropriately.

## Running
It should be as simple as running the following:
```
terraform plan -out plan
terraform apply plan
```

You can destroy any infrastructure with `terraform destroy`.
