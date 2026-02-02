module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name = var.name
  kubernetes_version = var.kube_version

  vpc_id = var.vpc_id
  subnet_ids = var.subnet_ids

  eks_managed_node_groups  = {
    default = {
      max_size     = var.max_capacity
      min_size     = var.min_capacity

      instance_types = var.instance_types
    }
  }
}