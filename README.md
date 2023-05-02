<h1 align="center">
<img src="/images/Diagram.jpg" width=100% height=100%>
</h1>

## Project workflow

1. Deploy VPC default in AWS
2. Create IAM role using Terraform. It consists policies for instance access to get SSH keypair from Parameter.
3. Generate SSH keypair and add to Parameter Store.
4. Provision EFS using Terraform. EFS is in 3 AZ and will be mounted into Jenkins Controller instance to keep all system files. This is to recovery when Jenkins Controller goes down and there will be another one up.
5. Build Jenkins Controller and Agent AMIs using Packer and Ansible.
6. Deploy Jenkins Auto Scaling Group (Controller) using Terraform.
7. Deploy Jenkins Agent using Terraform.
8. Configure SSH for Jenkins Controller and Agent.
