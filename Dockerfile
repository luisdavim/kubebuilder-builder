# Build the manager binary
FROM golang:1.12.7 as builder

ARG KB_VER=1.0.8
ARG ARCH=amd64

# Install Kubebuilder
 RUN curl -sLO "https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${KB_VER}/kubebuilder_${KB_VER}_linux_${ARCH}.tar.gz" && \
     tar -zxvf kubebuilder_${KB_VER}_linux_${ARCH}.tar.gz && \
     mv kubebuilder_${KB_VER}_linux_${ARCH} kubebuilder && mv kubebuilder /usr/local/ && \
     rm kubebuilder_${KB_VER}_linux_${ARCH}.tar.gz

