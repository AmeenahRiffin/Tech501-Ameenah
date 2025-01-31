# Securing the Database using a 3 Subnet Architecture

A three-subnet architecture is a common approach to secure database deployments in cloud environments. This design pattern creates isolation between different application tiers.

## Security Benefits

1. Network Segmentation
   - Each tier is isolated
   - Traffic flow can be strictly controlled
   - Reduced attack surface

2. Access Control
   - Public subnet: Internet-facing components only
   - Private subnet: Internal application components
   - DMZ subnet: Web-facing components with controlled access

## Implementation Best Practices

1. Network ACLs
   - Public subnet: Allow HTTP/HTTPS inbound
   - Private subnet: Allow only necessary ports from public subnet
   - DMZ subnet: Allow only web traffic from public subnet

## What is an NVA?

A Network Virtual Appliance (NVA) is often used to enhance network security and performance.

You can think of it as  a "network appliance" that can be deployed in a cloud environment. It's a virtual machine that performs a specific network function, like routing, firewalling, or load balancing. NVAs are often used to enhance network security and performance.