#!/bin/bash
mv backend.tf backend.tf.disabled
terraform init -migrate-state -force-copy

# Empty S3 bucket before destroying
aws s3 rm s3://terraform-state-bucket-20251108-unique --recursive
aws s3api list-object-versions --bucket terraform-state-bucket-20251108-unique --query 'Versions[].{Key:Key,VersionId:VersionId}' --output text | while read key version; do
  aws s3api delete-object --bucket terraform-state-bucket-20251108-unique --key "$key" --version-id "$version"
done

terraform destroy -auto-approve
