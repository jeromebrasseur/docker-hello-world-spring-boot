# Deploy Hello World Java Spring Boot using Jenkins

<p align="center"><img src="img/springboot-jenkins.jpg" width="50%"></p>

----

This repo provides the Jenkins configuration to deploy an hellow world java spring boot. 
Jenkins is an open-source automation server tool. It helps automate the build, testing, and deployment aspects of software development, and facilitates continuous integration and continuous delivery.

----

## Prerequisites


##### Install AWS CLI

```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip
rm -rf aws
```

##### Install Terraform

```
TF_VERSION=$(curl -sL https://releases.hashicorp.com/terraform/index.json | jq -r '.versions[].builds[].version' | grep -v 'rc|beta|alpha' | tail -1)

curl -LO "https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip"
unzip terraform_${TF_VERSION}_linux_amd64.zip
sudo mv -f terraform /usr/local/bin/
rm terraform_${TF_VERSION}_linux_amd64.zip
```

##### Connect Terraform with AWS

```
aws configure
```

## Create AWS Serverless Lambda

```
git clone https://github.com/jeromebrasseur/aws-serverless-lambda.git
cd aws-serverless-lambda
terraform init
terraform plan
terraform apply
```
