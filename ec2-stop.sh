#!/bin/bash


# Set your AWS instance ID
INSTANCE_ID="i-0ff2c1604defa0798" # Replace with your actual instance ID
REGION="us-east-1" # Replace with your actual region

# Check instance status
INSTANCE_STATE=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --region $REGION --query "Reservations[].Instances[].State.Name" --output text)

# If the instance is running, stop it
if [ "$INSTANCE_STATE" == "running" ]; then
	    echo "Instance $INSTANCE_ID is running. Stopping it now..."
	        aws ec2 stop-instances --instance-ids $INSTANCE_ID --region $REGION
	else
		    echo "Instance $INSTANCE_ID is not running. Current state: $INSTANCE_STATE"
	    fi
	    
