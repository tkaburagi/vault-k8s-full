path "aws/creds/read-s3" {
  capabilities = ["read"]
}

path "aws/roles/*" {
  capabilities = ["list", "read"]
}

path "transit/*" {
  capabilities = ["read", "create", "list", "update", "delete"]
}
