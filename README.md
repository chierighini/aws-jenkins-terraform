# Jenkins Terraform for AWS

## Usage

This is a Terraform module and must be called via the `module` resource:

```
module "jenkins" {
  source       = "github.com/chierighini/aws-terraform-jenkins.git"
  vpc_id       = your_vpc_id
  subnet_id    = your_subnet_id
  ssh_key_name = your_ssh_key
}
```

## In the main Terraform script that you're importing the module from:

Initialize terraform using 
```
$ terraform init
```

Then run 
```
$ terraform plan
```
Check if the changes match the expected infrastructure and run 

```
$ terraform apply
```

To update this module in your terraform script you can run either

```
$ terraform init -upgrade
```

or

```
$ terraform get -update
```