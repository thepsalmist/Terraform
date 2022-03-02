# Terafform project

## Create VPC

Define a VPC resource

## Create Internet Gateway

Create Internet Gateway and reference VPC ID
`vpc_id=aws_vpc.solana.id`

## Create Custom Route Table

Create a custom route table to allow access to the internet from the vPC via the IGW
`cidr_block = "0.0.0.0"` - Default route, send all traffic to the IGW

## Create Subnet

Using aws_subnet resource - create subnet where the EC2 instance will reside.
Create optional configuration of subnet availability zone `availability_zone =""`

### Route Table Association

Provides a resource to create an association between a route table and a subnet or a route table and an internet gateway or virtual private gateway.

Example
`resource "aws_route_table_association" "a" { subnet_id = aws_subnet.foo.id route_table_id = aws_route_table.bar.id }`

NOTE: One of either subnet_id or gateway_id is required
