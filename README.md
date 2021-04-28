```
vault policy write read-s3-transit read-s3-transit.hcl
```


```
kubectl exec -ti vault-0 /bin/sh

vault auth enable kubernetes

vault write auth/kubernetes/config \
   token_reviewer_jwt="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" \
   kubernetes_host=https://${KUBERNETES_PORT_443_TCP_ADDR}:443 \
   kubernetes_ca_cert=@/var/run/secrets/kubernetes.io/serviceaccount/ca.crt

vault write auth/kubernetes/role/read-s3-transit \
   bound_service_account_names=demoapp \
   bound_service_account_namespaces=default \
   policies=read-s3-transit  \
   ttl=1h
```