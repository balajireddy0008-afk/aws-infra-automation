import boto3

ec2 = boto3.client("ec2", region_name="ap-south-1")

response = ec2.describe_instances()

for reservation in response["Reservations"]:
    for instance in reservation["Instances"]:

        state = instance["State"]["Name"]

        if state != "running":
            continue

        print(f"Instance ID : {instance['InstanceId']}")
        print(f"State       : {state}")
        print(f"Private IP  : {instance.get('PrivateIpAddress')}")
        print(f"Public IP   : {instance.get('PublicIpAddress')}")
        print("-" * 50)