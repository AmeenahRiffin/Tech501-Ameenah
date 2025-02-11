CICD and Jenkins
================

- [CICD and Jenkins](#cicd-and-jenkins)
- [What is CI? Benefits?](#what-is-ci-benefits)
  - [Difference between CD and CDE](#difference-between-cd-and-cde)
- [What is Jenkins?](#what-is-jenkins)
  - [Why use Jenkins? Benefits of using Jenkins? Disadvantages?](#why-use-jenkins-benefits-of-using-jenkins-disadvantages)
  - [Stages of Jenkins](#stages-of-jenkins)
  - [What alternatives are there for Jenkins](#what-alternatives-are-there-for-jenkins)
  - [Why build a pipeline? Business value?](#why-build-a-pipeline-business-value)
  - [Create a general diagram of CICD](#create-a-general-diagram-of-cicd)
- [Other notes](#other-notes)
  - [Master Node](#master-node)
  - [Agent Nodes/Worker Nodes](#agent-nodesworker-nodes)
  - [Jenkins jobs and pipelines](#jenkins-jobs-and-pipelines)
  - [What are some of the required depdendencies for Jenkins?](#what-are-some-of-the-required-depdendencies-for-jenkins)

# What is CI? Benefits?

CI means Continuous Integration - tt's when code builds and tests happen automatically when someone adds new code. This is intended to catch problems early and stops bigger issues later. CI helps teams release faster, make better software, and save money.

## Difference between CD and CDE

In my research, I learned that while people often mix up CD and CDE, they're different:
- CD automatically builds, tests, and sends code to production
- CDE does all that plus automatically gives the changes to users

# What is Jenkins?

Jenkins is a free automation tool that helps with building, testing, and deploying software. Many teams use it for CI/CD pipelines.

## Why use Jenkins? Benefits of using Jenkins? Disadvantages?

Teams like Jenkins because:
- It's free and open source
- Has lots of plugins and users
- Very flexible for different tasks

But I also learned some downsides:
- Can be hard to set up
- Might be too complex for small teams

## Stages of Jenkins

Jenkins has these main stages: 
- Source
- Build
- Test
- Deploy
- Post-deploy.

## What alternatives are there for Jenkins

Alternatives to Jenkins:
- GitLab CI/CD
- Travis CI (I have used this in the past for code quality testing.)
- CircleCI
- TeamCity
- Github Actions
- Azure DevOps
- Bamboo

## Why build a pipeline? Business value?

My research showed pipelines help by:
- Making code changes automatic
- Getting updates to users faster
- Cutting costs
- Making software better

## Create a general diagram of CICD

From what I learned, a CICD pipeline flows like this: 
Test > Merge > Deploy

________________________

# Other notes

## Master Node

- The Jenkins Master Node is the main control center of your Jenkins installation.
- The master node is critical for Jenkins operations but typically doesn't run builds itself - it distributes them to agent nodes to maintain performance and scalability.

## Agent Nodes/Worker Nodes

- The Jenkins Agent Node is the computer that runs the Jenkins agent.
- The agent node runs the Jenkins plugins and executes the build steps defined in the Jenkinsfile.
- Jenkins agents are usually distributed across multiple machines to provide additional computing power and to reduce the load on the master node.


## Jenkins jobs and pipelines
- A Jenkins job is a single build task, such as building a project.
- A Jenkins pipeline is a series of jobs, which are executed in order.
- A pipeline can be used to automate a complete application lifecycle, from build to deployment.


## What are some of the required depdendencies for Jenkins?
- JDK (Java Development Kit)
- Port 8080
- 