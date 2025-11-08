#!/bin/bash
mv backend.tf backend.tf.disabled
terraform init -migrate-state -force-copy
terraform destroy -auto-approve
