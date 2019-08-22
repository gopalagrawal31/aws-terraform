# aws-terraform
"create aws resources using terraform"

It creates following AWS resources; 
* 1 VPC, 
* 1 public subnet,
* 1 prviate subnet,
* 1 Internet Gateway, 
* 1 Security Group
* 2 EC2 

once you clone this repo, please execute follow commands
```
ssh-keygen -f dev-region-key-pair
terraform init
terraform plan -out terraform.out
terraform apply terraform.out
```
