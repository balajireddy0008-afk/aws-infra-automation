import boto3
import csv

ec2 = boto3.client("ec2", region_name="ap-south-1")

response = ec2.describe_instances()

with open("ec2_report.csv", "w", newline="") as file:
    writer = csv.writer(file)

    writer.writerow([
        "InstanceId",
        "State",
        "PrivateIP",
        "PublicIP"
    ])

    for reservation in response["Reservations"]:
        for instance in reservation["Instances"]:
            writer.writerow([
                instance["InstanceId"],
                instance["State"]["Name"],
                instance.get("PrivateIpAddress"),
                instance.get("PublicIpAddress")
            ])

print("Report generated: ec2_report.csv")
