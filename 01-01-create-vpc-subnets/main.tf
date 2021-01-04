/* Staus of this template :  Run perfect  */
provider "aws" {
    region =var.region
  
}
resource "aws_vpc" "testVPC1_california" {
    provider = aws.California
    cidr_block           = var.vpcCIDRblock
    instance_tenancy     = var.instanceTenancy 
    enable_dns_support   = var.dnsSupport 
    enable_dns_hostnames = var.dnsHostNames
 
}

resource "aws_subnet" "public_subnet01" {

  vpc_id                  = aws_vpc.testVPC1_california.id
  cidr_block              = var.subnetCIDRblock
  map_public_ip_on_launch = var.mapPublicIP 
  availability_zone       = var.availabilityZone
  tags = {
    Name = "Public VPC Subnet Test"
  }
    
}
