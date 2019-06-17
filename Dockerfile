FROM ruby:2.6.3

# rubyの公式イメージがgemはglobalにインストールが正義って考えらしいが
# bundle系のコマンドに不具合が出るので、そこで設定しているENVを調整し直す
# ruby:2.6.3のイメージ
# https://github.com/docker-library/ruby/blob/9ae0943fa2935b3a13c72ae7d6afa2439145d7fa/2.6/stretch/Dockerfile
ENV GEM_HOME /usr/local/src/vendor/bundle
ENV BUNDLE_PATH="$GEM_HOME" \
	BUNDLE_SILENCE_ROOT_WARNING=1 \
	BUNDLE_APP_CONFIG="$GEM_HOME"
ENV PATH $GEM_HOME/bin:$BUNDLE_PATH/gems/bin:$PATH
RUN mkdir -p "$GEM_HOME" && chmod 777 "$GEM_HOME"

ENV LANG C.UTF-8
ENV WORKSPACE=/usr/local/src

# install bundler.
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt update && \
    apt install -y less build-essential nodejs && \
    gem install bundler && \
    npm install n -g && \
    n 8.15.1 && \
    npm install -g yarn && \
    apt clean

# create user and group.
RUN groupadd -r --gid 1000 app && \
    useradd -m -r --uid 1000 --gid 1000 app

USER app
WORKDIR $WORKSPACE