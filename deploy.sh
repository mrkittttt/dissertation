#!/usr/bin/env bash
set -euo pipefail

IPS=("192.168.137.11" "192.168.137.12" "192.168.137.13")

cd terraform/

echo "[+] Starting Terraform"
terraform apply -auto-approve
echo "[+] Terraform finished successfully, type 'terraform state list' for detailed information"

echo "[+] Waiting for SSH availability on all VMs..."
while :; do
    all_ready=true
    for ip in "${IPS[@]}"; do
        if ! nc -z "$ip" 22 >/dev/null 2>&1; then
            all_ready=false
            break
        fi
    done
    $all_ready && break
    sleep 2
done
echo "[+] SSH ports available"

cd ../ansible

echo "[+] Executing Ansible playbooks"
ansible-playbook main.yml
echo "[+] Ansible playbooks finished successfully"

