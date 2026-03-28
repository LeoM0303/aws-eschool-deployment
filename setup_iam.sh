#!/bin/bash
USER_NAME="eschool-admin"

if aws iam get-user --user-name $USER_NAME 2>/dev/null; then
  echo "User $USER_NAME already exists"
else
  aws iam create-user --user-name $USER_NAME
  aws iam attach-user-policy --user-name $USER_NAME --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
fi

aws iam create-access-key --user-name $USER_NAME > credentials.json
echo "Credentials saved to credentials.json"
