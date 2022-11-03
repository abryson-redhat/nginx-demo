#! /bin/bash -eu

oc project $1

# generated cert secret name has infinispan instance prefix
secret_name="${2}"

# create .crt file
oc get secret $secret_name -o jsonpath="{.data['tls\.crt']}" | base64 -D > ./tls.crt

# create .key file
oc get secret $secret_name -o jsonpath="{.data['tls\.key']}" | base64 -D > ./tls.key

# create trust store
#openssl pkcs12 -export -name "${3}-keystore" \
#               -in tls.crt -inkey tls.key \
#               -out $2
