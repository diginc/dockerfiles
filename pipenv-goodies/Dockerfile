# Based on https://github.com/Ilhicas/alpine-pipenv + docker + extra packages
FROM python:buster

# Only works for docker CLIENT (bind mounted socket)
COPY --from=docker:18.09.3 /usr/local/bin/docker /usr/local/bin/

RUN apt-get update && \
    apt-get install -y python3-dev curl gcc make \
        libffi-dev libssl-dev ${packages} \
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

