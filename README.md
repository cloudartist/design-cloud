# Cloud Design
In this repository you can find a simple AWS infastructure - written in terraform- which contains the following:
  * VPC
  * ECS with ALB
  * RDS (postgres)

In order to re-create AWS infrastructure from code - follow the steps below:
 
## Re-point terraform.tfstate to S3
Ignore this step if you want to use local state file
```
terraform remote config -backend=s3 -backend-config="bucket=terraform-home-inf-state" -backend-config="key=home/terraform.tfstate" -backend-config="region=eu-west-1"*
```

## Check syntax and get terraform files
```
terraform get
```

## Run terraform plan/apply
```
terraform plan -var-file=environment/local/terraform.tfvars
# if you're happy with plan - apply code
terraform apply -var-file=environment/local/terraform.tfvars
```

## Destroy infrastructure
```
terraform plan -destroy -target=module.rds -var-file=environment/local/terraform.tfvars
# if you're happy with plan of destruction - execute:
terraform apply -destroy -target=module.rds -var-file=environment/local/terraform.tfvars
```

