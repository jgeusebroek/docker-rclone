FROM alpine:latest
LABEL maintainer="Jeroen Geusebroek <me@jeroengeusebroek.nl>"

ENV PACKAGE_LIST="curl fuse" \
    LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TIMEZONE='Europe/Amsterdam'

RUN apk add --no-cache ${PACKAGE_LIST} && \

    # Download and install latest rclone
    curl --tlsv1 -L -o /tmp/rclone.zip http://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip /tmp/rclone.zip -d /tmp && \
    cp /tmp/rclone-*/rclone /usr/local/bin && \
    rm -rf /tmp/*

VOLUME ["/root"]

ENTRYPOINT ["rclone"]
CMD [""]