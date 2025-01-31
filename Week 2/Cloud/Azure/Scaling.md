
- [Scaling up and down](#scaling-up-and-down)
- [Scaling in and out](#scaling-in-and-out)
  - [Scale Set](#scale-set)
  - [How to make a scale set in Azure](#how-to-make-a-scale-set-in-azure)
  - [Instance Health Status](#instance-health-status)


## Scaling up and down
Scaling up (vertical scaling) involves increasing the resources (CPU, RAM, etc.) of an individual VM to handle more load. Scaling down is the opposite - reducing resources when they're not needed. This is done by changing the VM size/SKU.

**Example:**
```
  +---------------+
  |  Small VM     |
  | CPU: 2 cores  |
  | RAM: 4GB      |
  +---------------+
           |
           |  Scale Up
           v
  +---------------+
  |  Medium VM    |
  | CPU: 4 cores  |
  | RAM: 8GB      |
  +---------------+
           |
           |  Scale Up
           v
  +---------------+
  |  Large VM     |
  | CPU: 8 cores  |
  | RAM: 16GB     |
  +---------------+
```


## Scaling in and out
Scaling out (horizontal scaling) means adding more VM instances to distribute the workload. Scaling in means removing VM instances when demand decreases. This is typically managed through VM Scale Sets in Azure.

**Example:**
```
  +---------------+
  |  Single VM   |
  +---------------+
           |
           |
           v
  +---------------+---------------+
  |  VM Scale Set  |  (up to 1000) |
  +---------------+---------------+
           |
           |
           v
  +---------------+---------------+---------------+
  |  VM 1    |  VM 2    |  ...  |  VM N    |
  +---------------+---------------+---------------+


```

### Scale Set

A VM Scale Set is an Azure resource that lets you deploy and manage a collection of identical VMs as a single entity.

- Automatic scaling based on demand or schedule
- Support for up to 1000 VM instances
- Built-in load balancing
- High availability and fault tolerance
- Centralized management and updates
- Integration with Azure Monitor for metrics


### How to make a scale set in Azure

1. Navigate to the Azure portal
2. Search for "Virtual machine scale sets" and click on the result
3. Click on "Create"
4. Fill in the Basics:
	 - Resource Group: tech501
	 - Name: tech501-ameenah-sparta-app-vmss-2
	 - Availability zones: 1, 2, 3
	 - Orchestration mode: Uniform
	 - Security Type: Standard
	 - Scaling Mode: Autoscaling
	 - Configure scaling:
		 - Default Instance Count: 2
		 - Minimum: 2
		 - Maximum: 3
		 - CPU threshold: 75%
		 - Increase instance count by: 1
	 - Image: tech501-ameenah-deploy-app-generalised-vm-image-20250128180630
	 - Size: Standard B1s
	 - SSH public key:
		 - Username: adminuser
		 - Stored Keys: tech501-ameenah-az-key
	 - Licensing type: Other

5. Configure Disks:
	 - OS disk type: Standard SSD

6. Configure Networking:
	 - VNet: tech501-ameenah-2-subnet-vnet
	 - Subnet: public-subnet
	 - Network Interface:
		 - Name: tech501-ameenah-2-subnet-vnet-nic01
		 - Subnet: public-subnet
		 - NIC NSG: Advanced
			 - tech501-ameenah-sparta-app-vmss-2-nsg
			 - public IP address: disabled
	 - Load Balancing:
		 - Azure Load Balancer
		 - Create new load balancer:
			 - Name: tech501-ameenah-sparta-app-lb-2
			 - Type: public
			 - Protocol: TCP
			 - Load Balancer Rule:
				 - Frontend port: 80
				 - Backend port: 80
			 - Inbound NAT rule:
				 - Frontend port range start: 50000
				 - Backend port: 22

7. Configure Health:
	 - Enable application health monitoring
	 - Recovery:
		 - Automatic repairs
		 - Repair actions: replace
		 - Grace period (min): 10

8. Configure Advanced:
	 - User data:
	 
	 (add user data we made earlier here here)
	 
9. Add Tags:
	 - Owner: ameenah

### Instance Health Status

Azure monitors the health of VM instances in a scale set to ensure optimal performance:

- **Healthy**: The instance is running and performing as expected.
- **Unhealthy**: The instance is not running or is not performing as expected.

You can view the health status of instances in scale sets 