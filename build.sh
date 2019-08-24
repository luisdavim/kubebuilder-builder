#! /usr/bin/env bash

RELEASES=$(curl -sL https://api.github.com/repos/kubernetes-sigs/kubebuilder/releases | jq -r '.[]|select(.assets|length >=1)|.tag_name'|grep -E '^v([0-9]+\.){2,}.*$'|sed -e 's/^v//g')

for REL in $(echo $RELEASES); do
  echo ">>> Building image for Kubebuilder v${REL} <<<"
  docker build --build-arg KB_VER=${REL} -t luisdavim/kubebuilder-builder:v${REL} .
done
