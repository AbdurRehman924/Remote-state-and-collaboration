# Remote State and Collaboration

## Problem
By default, Terraform stores state locally in `terraform.tfstate` file. This creates problems for team collaboration:
- State file conflicts when multiple people work on same infrastructure
- No state locking mechanism to prevent concurrent modifications
- State file can be lost or corrupted
- No centralized source of truth

## Solution
Store Terraform state remotely in S3 with DynamoDB locking for team collaboration.

## What This Project Does

### 1. **Remote State Storage**
- Stores state in S3 bucket instead of local file
- Enables multiple team members to share same state
- Provides state versioning and backup

### 2. **State Locking**
- Uses DynamoDB table to lock state during operations
- Prevents multiple people from modifying infrastructure simultaneously
- Avoids state corruption from concurrent access

### 3. **Bootstrap Process**
- Solves chicken-and-egg problem: "How do you create S3 bucket for state storage when you need state storage to create S3 bucket?"
- Creates backend infrastructure with local state first
- Then migrates to remote state

## Usage

### Setup
```bash
./bootstrap.sh
```

### Destroy
```bash
./destroy.sh  # Required to avoid state lock errors
```

## How It Works

1. **Bootstrap Phase**: Creates S3 + DynamoDB with local state
2. **Migration Phase**: Moves state from local to S3
3. **Remote Phase**: All future operations use remote state with locking

## Files
- `main.tf` - S3 bucket and DynamoDB table
- `backend.tf` - S3 backend configuration  
- `bootstrap.sh` - Automated setup script
- `destroy.sh` - Safe cleanup script

## Learning Outcomes
- Understand remote state benefits
- Learn backend configuration
- Experience state migration process
- Handle state locking mechanisms
