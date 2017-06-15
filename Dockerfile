FROM goodrainapps/openjdk:8u131-jdk-alpine

MAINTAINER zhouyq@goodrain.com

# Set vars
ENV ARTIFACTORY_USER_NAME=artifactory \
    ARTIFACTORY_USER_ID=1030 \
    ARTIFACTORY_HOME=/opt/jfrog/artifactory \
    ARTIFACTORY_DATA=/var/opt/jfrog/artifactory \
    RECOMMENDED_MAX_OPEN_FILES=32000 \
    MIN_MAX_OPEN_FILES=10000 \
    RECOMMENDED_MAX_OPEN_PROCESSES=1024 \
    POSTGRESQL_VERSION=9.4.1212

ENV ARTIFACTORY_VER=5.3.0 \
    DOWNLOAD_URL="http://goodrain-pkg.oss-cn-shanghai.aliyuncs.com"

COPY entrypoint-artifactory.sh /

RUN mkdir -pv /opt/jfrog \
    && curl -q ${DOWNLOAD_URL}/artifactory-oss-${ARTIFACTORY_VER}.tar.gz | tar -xzC /opt/jfrog/ \
    && curl -q ${DOWNLOAD_URL}/data.tar.gz | tar -xzC /tmp \
    && mv ${ARTIFACTORY_HOME}*/ ${ARTIFACTORY_HOME}/ \
    && mv ${ARTIFACTORY_HOME}/etc ${ARTIFACTORY_HOME}/etc.orig/ \
    && rm -rf ${ARTIFACTORY_HOME}/logs \
    && addgroup -g ${ARTIFACTORY_USER_ID} ${ARTIFACTORY_USER_NAME} \
    && adduser -u ${ARTIFACTORY_USER_ID} -D -S -G ${ARTIFACTORY_USER_NAME} ${ARTIFACTORY_USER_NAME} \
    && chown -R ${ARTIFACTORY_USER_NAME}:${ARTIFACTORY_USER_NAME} ${ARTIFACTORY_HOME} \
    && chmod +x /entrypoint-artifactory.sh

# Default mounts. Should be passed in `docker run` or in docker-compose
VOLUME /var/opt/jfrog/artifactory

# Expose Tomcat's port
EXPOSE 8081

# Start the simple standalone mode of Artifactory
ENTRYPOINT /entrypoint-artifactory.sh
