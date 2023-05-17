#!/bin/bash
# AWS EC2 instance details
AMI_ID="ami-0889a44b331db0194"
INSTANCE_TYPE="t2.micro"
KEY_NAME="linuxnv"
SECURITY_GROUP_ID="sg-0cd3869cce8acd048"
SUBNET_ID="subnet-0cfaf622c795b85e4"
# Launch EC2 instance
INSTANCE_ID=$(aws ec2 run-instances \
  --image-id "$AMI_ID" \
  --instance-type "$INSTANCE_TYPE" \
  --key-name "$KEY_NAME" \
  --security-group-ids "$SECURITY_GROUP_ID" \
  --subnet-id "$SUBNET_ID" \
  --output text --query 'Instances[0].InstanceId'
)
# Wait until the instance is running
aws ec2 wait instance-running --instance-ids "$INSTANCE_ID"
echo "EC2 instance $INSTANCE_ID is now running!"
