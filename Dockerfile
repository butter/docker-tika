FROM openjdk:8
MAINTAINER Butter.ai dev@butter.ai

EXPOSE 9998

ENV TIKA_VERSION 1.16

RUN apt-get update && apt-get install -y --no-install-recommends \
    tesseract-ocr \
    tesseract-ocr-eng \
 && curl -sSL https://www.apache.org/dist/tika/tika-server-${TIKA_VERSION}.jar -o /usr/local/bin/tika.jar \
 && export GNUPGHOME="$(mktemp -d)" \
 && curl -sSL https://raw.githubusercontent.com/apache/tika/master/KEYS | gpg --import \
 && curl -sSL https://www.apache.org/dist/tika/tika-server-${TIKA_VERSION}.jar.asc -o /tmp/tika.jar.asc \
 && gpg --verify /tmp/tika.jar.asc /usr/local/bin/tika.jar \
 && apt-get clean -y && rm -rf /var/lib/apt/lists/* && rm -r "$GNUPGHOME" /tmp/tika.jar.asc

COPY tika-config.xml /

ENTRYPOINT java -jar /usr/local/bin/tika.jar -h 0.0.0.0 -c /tika-config.xml
