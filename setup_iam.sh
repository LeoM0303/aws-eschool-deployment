#!/bin/bash
aws iam create-user --user-name eschool-admin

aws iam attach-user-policy --user-name eschool-admin --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

aws iam create-access-key --user-name eschool-admin > credentials.json

echo "Credentials saved to credentials.json"
echo "Access Key ID: $(cat credentials.json | python3 -c "import sys, json; print(json.load(sys.stdin)['AccessKey']['AccessKeyId'])")"
