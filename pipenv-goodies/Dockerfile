# Based on https://github.com/Ilhicas/alpine-pipenv + docker + extra packages
FROM docker:latest

ARG packages
RUN apk --update add bash python3 python3-dev curl gcc make \
        musl-dev libffi-dev openssl-dev ${packages} \
    && rm -rf /var/cache/apk/* \
    && pip3 install -U pip pipenv

WORKDIR /workspace

# Also do a little runtime magic
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]
CMD ["--help"]

# -- Adding Pipfiles
ONBUILD COPY Pipfile Pipfile
ONBUILD COPY Pipfile.lock Pipfile.lock
# -- Install dependencies:
ONBUILD RUN set -ex && pipenv install --deploy --system

