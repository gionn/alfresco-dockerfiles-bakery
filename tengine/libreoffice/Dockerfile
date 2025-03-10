FROM java_base

ENV JAVA_OPTS_CONTAINER_FLAGS=-XX:MaxRAMPercentage=80

EXPOSE 8090

ARG ALFRESCO_LIBREOFFICE_GROUP_NAME
ARG ALFRESCO_LIBREOFFICE_GROUP_ID
ARG ALFRESCO_LIBREOFFICE_USER_NAME
ARG ALFRESCO_LIBREOFFICE_USER_ID
ARG TARGETARCH

RUN --mount=type=bind,source=/,target=/dist \
    yum install -y cairo cups-libs libSM libGLU && \
    if [ "$TARGETARCH" == 'arm64' ]; then \
        yum --enablerepo=devel install -y libreoffice && \
        update-alternatives --set java java-17-openjdk.aarch64; \
    else \
        mkdir /tmp/dist && \
        tar xzf /dist/*.gz -C /tmp/dist && \
        yum localinstall -y /tmp/dist/LibreOffice*/RPMS/*.rpm; \
    fi && \
    rm -rf /tmp/dist && \
    yum clean all

ADD alfresco-transform-libreoffice*.jar /opt/app.jar

RUN groupadd -g ${ALFRESCO_LIBREOFFICE_GROUP_ID} ${ALFRESCO_LIBREOFFICE_GROUP_NAME} && \
    useradd -u ${ALFRESCO_LIBREOFFICE_USER_ID} -g ${ALFRESCO_LIBREOFFICE_GROUP_NAME} ${ALFRESCO_LIBREOFFICE_USER_NAME} && \
    chgrp ${ALFRESCO_LIBREOFFICE_GROUP_NAME} /opt/app.jar

USER ${ALFRESCO_LIBREOFFICE_USER_NAME}

HEALTHCHECK --interval=20s --timeout=10s --retries=3 --start-period=30s \
  CMD curl -f http://localhost:8090/live || exit 1

COPY entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
