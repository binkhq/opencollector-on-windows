FROM centos:7

RUN yum -y update && yum install -y yum-utils && \
    yum-config-manager \
        --add-repo \
        https://download.docker.com/linux/centos/docker-ce.repo && \
    yum -y install docker-ce-cli wget && \
    wget https://raw.githubusercontent.com/logrhythm/versions/master/lrctl && \
    sed -i '/\/root\/.docker/d' lrctl && \
    sed -i '/replaceSelf "${temp_file}"/d' lrctl && \
    chmod +x lrctl && mv lrctl /usr/local/bin

ENTRYPOINT ["/usr/local/bin/lrctl"]
