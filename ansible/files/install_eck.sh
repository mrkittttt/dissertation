# Adding helm chart repo and updating it
helm repo add elastic https://helm.elastic.co
helm repo update

# Installation of elastic-operator
helm install elastic-operator elastic/eck-operator -n elastic-system --create-namespace --wait

# Installing Elasticsearch and Kibana
# Namespace shall be different from elastic-system, where an elastic-operator works
helm install elastic-stack elastic/eck-stack -f stack-values.yml -n elastic-stack --create-namespace --wait
