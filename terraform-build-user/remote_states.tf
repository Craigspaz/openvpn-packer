# ------------------------------------------------------------------------------
# Retrieves state data from Terraform backends. This allows use of the
# root-level outputs of one or more Terraform configurations as input data
# for this configuration.
# ------------------------------------------------------------------------------

data "terraform_remote_state" "images_parameterstore_production" {
  backend = "s3"

  config = {
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    key            = "cool-images-parameterstore/terraform.tfstate"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
  }

  workspace = "production"
}

data "terraform_remote_state" "images_parameterstore_staging" {
  backend = "s3"

  config = {
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    key            = "cool-images-parameterstore/terraform.tfstate"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
  }

  workspace = "staging"
}

data "terraform_remote_state" "images_production" {
  backend = "s3"

  config = {
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    key            = "cool-accounts/images.tfstate"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
  }

  workspace = "production"
}

data "terraform_remote_state" "images_staging" {
  backend = "s3"

  config = {
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    key            = "cool-accounts/images.tfstate"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
  }

  workspace = "staging"
}

data "terraform_remote_state" "ansible_role_cdm_certificates" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "ansible-role-cdm-certificates/terraform.tfstate"
  }
}

data "terraform_remote_state" "ansible_role_cdm_nessus_agent" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "ansible-role-cdm-nessus-agent/terraform.tfstate"
  }
}

data "terraform_remote_state" "ansible_role_crowdstrike" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "ansible-role-crowdstrike/terraform.tfstate"
  }
}

data "terraform_remote_state" "users" {
  backend = "s3"

  config = {
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    key            = "cool-accounts/users.tfstate"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
  }

  workspace = "production"
}
