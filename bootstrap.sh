#!/bin/bash

mv backend.tf backend.tf.disabled 2>/dev/null || true
terraform init
terraform apply -auto-approve
mv backend.tf.disabled backend.tf
echo "yes" | terraform init
echo "✅ Done!"
