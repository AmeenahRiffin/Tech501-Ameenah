# Securing the Database using a 3 Subnet Architecture

A three-subnet architecture is a common approach to secure database deployments in cloud environments. This design pattern creates isolation between different application tiers.

## Subnet Layout

```
+----------------+----------------+----------------+
|   Public       |   DMZ          |   Private     |
|   Subnet       |   Subnet       |   Subnet      |
| (10.0.2.0/24)  | (10.0.3.0/24)  | (10.0.4.0/24) |
+----------------+----------------+----------------+
| - Load         | - Web servers  | - App servers |
|   balancers    | - Proxy       | - Database    |
| - NAT gateway  | - Reverse     |   instances   |
| - VPN gateway  |   proxy       | - Internal    |
|                |               |   services    |
+----------------+----------------+----------------+

Network Configuration Details:
+----------------+----------------+----------------+
| Public Subnet  | DMZ Subnet    | Private Subnet |
+----------------+----------------+----------------+
| NSG Rules:     | NSG Rules:    | NSG Rules:     |
| - Allow 80/443 | - Allow from  | - Allow from   |
|   inbound      |   public only |   DMZ only     |
| - Allow VPN    | - Block direct| - Block all    |
|   traffic      |   internet    |   internet     |
|                |               |                |
| Components:    | Components:   | Components:    |
| - NVAs with    | - NICs with   | - NICs with    |
|   public IPs   |   private IPs |   private IPs  |
| - Route tables | - User-defined| - Internal     |
|   for NAT/VPN  |   routes     |   load balance |
|                |               |                |
| Traffic Flow:  | Traffic Flow: | Traffic Flow:  |
| → Internet     | → Inspected   | → Backend      |
| → NAT/routing  | → Filtered    | → Database     |
| → DMZ subnet   | → Forwarded   | → Processing   |
+----------------+----------------+----------------+
```
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

2. Security Groups
```
+-------------------+----------------------+
| Component         | Allowed Access       |
+-------------------+----------------------+
| Load Balancer     | Internet (80/443)    |
| App Servers       | Load Balancer        |
| Database          | App Servers Only     |
+-------------------+----------------------+
```

3. Additional Security Measures
   - Encryption in transit
   - Encryption at rest
   - Regular security audits
   - Monitoring and logging
   - Backup and disaster recovery

## What is an NVA?

A Network Virtual Appliance (NVA) is often used to enhance network security and performance.

You can think of it as  a "network appliance" that can be deployed in a cloud environment. It's a virtual machine that performs a specific network function, like routing, firewalling, or load balancing. NVAs are often used to enhance network security and performance.