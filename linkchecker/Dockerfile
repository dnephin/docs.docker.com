
FROM    debian:jessie

RUN     apt-get update && \
        DEBIAN_FRONTEND=noninteractive apt-get install -y \
            locales \
            linkchecker \
            patch

RUN     locale-gen en_US.UTF-8
ENV     LANG en_US.UTF-8

# Patch to fix ssl bug, see https://github.com/wummel/linkchecker/issues/566
COPY    . /src
RUN     patch /usr/lib/python2.7/dist-packages/linkcheck/httputil.py /src/httputil.py.patch

RUN     adduser checker --disabled-password
USER    checker
ENTRYPOINT ["linkchecker"]
