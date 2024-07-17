FROM openjdk:22-slim-bullseye

ENV SMITHY_VERSION=1.50.0

RUN apt-get update && apt-get install curl unzip -y

RUN mkdir -p smithy-install/smithy && \
    curl -L https://github.com/smithy-lang/smithy/releases/download/${SMITHY_VERSION}/smithy-cli-linux-aarch64.zip -o smithy-install/smithy-cli-linux-aarch64.zip && \
    unzip smithy-install/smithy-cli-linux-aarch64.zip -d smithy-install/smithy

RUN smithy-install/smithy/smithy-cli-linux-aarch64/install

RUN rm -rf smithy-install/
