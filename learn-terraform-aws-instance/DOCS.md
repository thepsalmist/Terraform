# Terraform

## Create Infrastructure

### Providers

A provider is a plugin that Terraform uses to create and manage your resources.
The provider block configures the specified provider, in thi case aws

### Resources

Use resource blocks to define components of your infrastructure. A resource might be a physical or virtual component such as EC2 instance

Syntax `resource "<provider>_<resource_type> "name" { config options ........ key = "value" }`

Resource blocks have two strings before the block: the resource type and the resource name. Example resource type== aws_instance, resource name == "app_server". The prefix of the type maps to the name of the provider.
Together, the resource type and resource name form a unique ID for the resource. Example ID for EC2 instance `aws_instance.app_server`

Resource blocks contain arguments/ config options which you use to configure resources.
Arguments can be things like the machine sizes, disk image names or VPC IDS.

### Initialize the directory

When you create new configuration -- or check out an existing configuration from version control. Initialize the directory with `terraform init`

### Format and validate the configuration

`terraform fmt` - The command automatically updates the configurations in the current directory for readability and consistenct

`terraform validate` - The command makes sure the configuration is syntactically valid and internally consistent

### Create Infrastructrure

`terraform apply` - The command applies the configuration

### Inspect State

Terraform creates a `terraform.tfstate` file thst stores the IDs and properties of the resources it manages in the file. The Terraform state file allows Terraform to track which resources it manages,

`terraform show` - Inspect the current state

## Change Infrastructure

To change infrastructure, update the terraform configuration file and run the `terraform apply` command to apply the changes to the existing resources.
The prefix -/+ means terraform will destroy the resource, rather tha update.
The ~ prefix means Terraform will update the resource.

## Destroy Infrastructure

The `terraform destroy` command destroys infrastructure managed by your Terraform Project.

## Reference Resources

### Create a VPC and Subnet

Create a VPC and a Subnet within the VPC. Reference the VPC ID within the subnet resource block
Format - `resource_type.resource_name.id`

## Terraform Files

The `.terraform` folder is createdd when we run the `.terraform init` command. All the provider's plugins are installed within the folder

The `terraform.tfstate` - stores state of the resource

## Terraform Project

1. Create a VPC
2. Create Internet Gateway
3. Create Custom Route Table
4. Create a Subnet
5. Associate sunet with Route Table
6. Create security group to allow port 22,80,443
7. Create a network interface with an IP in the subnet
8. Assign an elastic IP to the network interface created in step 7
9. Create Ubuntu server and install apache2.nginx
