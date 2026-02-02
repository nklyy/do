include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../infra/modules//eks"
}

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs_allowed_terraform_commands = ["plan", "state"]

  mock_outputs = {
    id     = "vpc-123456"
    private_subnets = ["subnet-123456", "subnet-654321"]
  }
}

inputs = {
  name = "latency-monitor-cluster"
  kubernetes_version = "1.30"

  vpc_id = dependency.vpc.outputs.id
  subnet_ids = dependency.vpc.outputs.private_subnets

  max_capacity = 2
  min_capacity = 1
  instance_types = ["t3.medium"]
}