# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

Our root module structure is as follows:

```
PROJECT_ROOT
│
├── main.tf                 # everything else.
├── variables.tf            # stores the structure of input variables
├── terraform.tfvars        # the data of variables we want to load into our terraform project
├── providers.tf            # defined required providers and their configuration
├── outputs.tf              # stores our outputs
└── README.md               # required for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and Input Variables

### Terraform Cloud Variables

In terraform we can set two kind of variables:
- Enviroment Variables - those you would set in your bash terminal eg. AWS credentials
- Terraform Variables - those that you would normally set in your tfvars file

We can set Terraform Cloud variables to be sensitive so they are not shown visibliy in the UI.

### Loading Terraform Input Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

### var flag
We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform plan -var user_uuid="my-user_uuid"`

### var-file flag
The `var-file` flag is used to specify a file(eg `variables.tfvars`) containing variable values for a Terraform configuration. It allows you to separate variable values from your main Terraform configuration, making it easier to manage and share configuration details eg. `terraform apply -var-file=variables.tfvars`

### terraform.tfvars

This is the default file to load in terraform variables in bulk

### auto.tfvars
Automatically loads variable values without the need to specify a `-var-file` flag explicitly. The file must be named exactly `auto.tfvars` for Terraform to recognize and automatically load it. When you run terraform apply or other Terraform commands that require variable values, Terraform automatically looks for and loads the `auto.tfvars` file in the same directory.

### order of terraform variables

Terraform uses a specific order of precedence when determining the value of a variable. If the same variable is assigned multiple values, Terraform will use the value of highest precedence, overriding any other values. Below is the precedence order starting from the highest priority to the lowest.

  - Environment variables (TF_VAR_variable_name)
  - The `terraform.tfvars` file
  - The `terraform.tfvars.json` file
  - Any `.auto.tfvars` or `.auto.tfvars.json` files, processed in lexical order of their filenames.
  - Any `-var` and `-var-file` options on the command line, in the order they are provided.
  - Variable defaults

[https://www.env0.com/blog/terraform-variables](https://www.env0.com/blog/terraform-variables)

## Dealing With Configuration Drift

## What happens if we lose our state file?

If you lose your statefile, you most likley have to tear down all your cloud infrastructure manually.

You can use terraform import but it won't for all cloud resources. You need check the terraform providers documentation for which resources support import.

### Fix Missing Resources with Terraform Import

`terraform import aws_s3_bucket.bucket bucket-name`

[Terraform Import](https://developer.hashicorp.com/terraform/cli/import)
[AWS S3 Bucket Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)

### Fix Manual Configuration

If someone goes and delete or modifies cloud resource manually through ClickOps. 

If we run Terraform plan is with attempt to put our infrstraucture back into the expected state fixing Configuration Drift


## Fix using Terraform Refresh

```sh
terraform apply -refresh-only -auto-approve
```

## Terraform Modules

### Terraform Module Structure

It is recommend to place modules in a `modules` directory when locally developing modules but you can name it whatever you like.

### Passing Input Variables

We can pass input variables to our module.
The module has to declare the terraform variables in its own variables.tf

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
```

### Modules Sources

Using the source we can import the module from various places eg:
- locally
- Github
- Terraform Registry

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
}
```


[Modules Sources](https://developer.hashicorp.com/terraform/language/modules/sources)