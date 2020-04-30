FROM buildpack-deps:stable-scm

ADD install.sh /
RUN apt-get update && \
    apt-get install -y unzip bash && \
    /install.sh
