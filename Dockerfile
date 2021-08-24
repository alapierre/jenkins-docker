FROM jenkins/jenkins:lts
USER root

ENV TRIVY_VERSION 0.12.0

RUN apt-get update && apt-get install -y \
       apt-transport-https \
       ca-certificates \
       curl \
       gnupg2 \
       software-properties-common \
       vim
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -  && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) \
       stable"

RUN apt-get update && \
    apt-get install -y docker-ce-cli && \
    apt --fix-broken install -y rpm && \
    groupadd docker && usermod -a -G docker jenkins && \
    wget https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSION}/trivy_${TRIVY_VERSION}_Linux-64bit.deb && \
    dpkg -i trivy_${TRIVY_VERSION}_Linux-64bit.deb
# WARNING: you need tailor guid for group docker - guid must be the same as in host
USER jenkins
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
