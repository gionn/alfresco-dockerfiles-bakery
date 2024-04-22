#!/bin/bash -e
# Fetch artifact from Nexus which will be used to build the Docker image

ARTIFACT_NAME=$1
DEFAULT_ARTIFACT_NAME=alfresco-content-services-distribution

ARTIFACT_VERSION=$2
DEFAULT_ARTIFACT_VERSION=23.2.1

GROUP_ID=$3
DEFAULT_GROUP_ID=org.alfresco

if [ -z "$ARTIFACT_NAME" ]; then
    ARTIFACT_NAME=$DEFAULT_ARTIFACT_NAME
fi

if [ -z "$ARTIFACT_VERSION" ]; then
    ARTIFACT_VERSION=$DEFAULT_ARTIFACT_VERSION
fi

if [ -z "$GROUP_ID" ]; then
    GROUP_ID=$DEFAULT_GROUP_ID
fi

GROUP_ID_AS_PATH=$(echo "$GROUP_ID" | tr . /)


echo "Downloading $GROUP_ID:$ARTIFACT_NAME $ARTIFACT_VERSION from Nexus"
wget --user "$NEXUS_USERNAME:$NEXUS_PASSWORD" \
    "https://nexus.alfresco.com/nexus/service/local/repositories/enterprise-releases/content/$GROUP_ID_AS_PATH/$ARTIFACT_NAME/${ARTIFACT_VERSION}/$ARTIFACT_NAME-${ARTIFACT_VERSION}.zip"
