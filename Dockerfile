FROM alpine

ENV KUBE_LATEST_VERSION="v1.5.4"

RUN apk add --update curl \ 
    && rm -rf /var/cache/apk/* \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && curl https://storage.googleapis.com/kubernetes-helm/helm-v2.3.1-linux-amd64.tar.gz | tar xvz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && rm -rf linux-amd64/* \
    && chmod +x /usr/local/bin/kubectl

ADD entrypoint.sh /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
