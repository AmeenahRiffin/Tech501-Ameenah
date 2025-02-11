![alt text](image.png)

# What is Terraform?

Terraform is an infrastructure as code (IaC) tool that allows you to define and manage your cloud and on-premises resources using a human-readable configuration file. Terraform supports a wide range of providers, including AWS, Azure, Google Cloud, and many others.

# What is Terraform used for?

Terraform is used to create, manage, and version infrastructure as code. It is used to manage the entire lifecycle of infrastructure, from creation to destruction.

# Why use Terraform?

Terraform is used because it allows you to manage your infrastructure in a version controlled way. It also allows you to manage a wide range of resources, and to manage the dependencies between them.

# What are the benefits of Terraform?

The benefits of Terraform include:

* Version control of infrastructure
* Supports a wide range of providers
* Allows you to manage the dependencies between resources
* Allows you to create, manage, and version infrastructure as code

# What are the alternatives to Terraform?

Some of the alternatives to Terraform include:



# Who is using Terraform in the industry?

Many companies are using Terraform in the industry, including:
- Microsoft
- Apple
- Deloitte
- Expedia
- Starbucks
- Unity
- Many large financial institutions

# What is orchestration in IaC?

Orchestration in IaC is the process of managing the creation, scaling, and deletion of resources. It is used to manage the dependencies between resources, and to manage the lifecycle of resources.

# How does Terraform act as an "orchestrator"?

Terraform acts as an "orchestrator" by managing the creation, scaling, and deletion of resources. It is used to manage the dependencies between resources, and to manage the lifecycle of resources.

# Best practice supplying AWS credentials to Terraform

If Terraform needs AWS access, there are different options on supplying the AWS credentials to Terraform. The order in which Terraform looks up AWS credentials is:

1. The `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables
2. The `~/.aws/credentials` file
3. The `~/.aws/credentials` file in the AWS SDKs default credential profiles file location
4. The EC2 instance metadata service

The best practice is to supply AWS credentials to Terraform using the `~/.aws/credentials` file. This file should contain the AWS access key ID and secret access key for the AWS account that you want to use with Terraform.

You should never pass AWS credentials to Terraform as command line arguments or as environment variables. This is because it is not secure, and it is easy for someone to accidentally expose your AWS credentials.

# Why use Terraform for different environments (e.g. production, testing, etc)

Terraform can be used to manage different environments, such as production, testing, etc. This is useful because it allows you to manage the infrastructure for each environment separately, and to manage the dependencies between resources in each environment. It also allows you to create, manage, and version infrastructure as code for each environment.

