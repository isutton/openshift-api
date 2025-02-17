#!/bin/bash

source "$(dirname "${BASH_SOURCE}")/lib/init.sh"

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})/..
CODEGEN_PKG=${CODEGEN_PKG:-$(cd ${SCRIPT_ROOT}; ls -d -1 ./vendor/k8s.io/code-generator 2>/dev/null || echo ../../../k8s.io/code-generator)}

verify="${VERIFY:-}"

GOFLAGS="" bash ${CODEGEN_PKG}/generate-groups.sh "deepcopy" \
  github.com/openshift/api/generated \
  github.com/openshift/api \
  "apiserver:v1 apps:v1 authorization:v1 build:v1 config:v1 helm:v1beta1 console:v1 console:v1alpha1 image:v1,docker10,dockerpre012 imageregistry:v1 kubecontrolplane:v1 legacyconfig:v1 cloudnetwork:v1 network:v1 networkoperator:v1 oauth:v1 openshiftcontrolplane:v1 operator:v1 operator:v1alpha1 operatorcontrolplane:v1alpha1 operatoringress:v1 osin:v1 project:v1 quota:v1 route:v1 samples:v1 security:v1 securityinternal:v1 servicecertsigner:v1alpha1 sharedresource:v1alpha1 template:v1 user:v1 machine:v1beta1 machine:v1 monitoring:v1alpha1" \
  --go-header-file ${SCRIPT_ROOT}/hack/empty.txt \
  ${verify}

