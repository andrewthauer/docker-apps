FROM ruby

RUN set -ex \
 && apt-get update && apt-get install -y \
      libicu-dev \
      cmake \
 && rm -rf /var/lib/apt/lists/*

RUN set -ex \
 && gem install github-linguist \
 && gem install gollum \
 && gem install omnigollum

WORKDIR /wiki

ENTRYPOINT ["gollum", "--port", "80"]

EXPOSE 80
