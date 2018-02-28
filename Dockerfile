FROM ruby:2.2.9

ENV NODE_VERSION 8.9.4

RUN apt-get update -qq && apt-get install -y \
  imagemagick \
  build-essential \
  libpq-dev

RUN mkdir -p /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN gem install bundler
RUN bundle install

RUN curl -SLO "http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
    && tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
    && npm install -g npm
RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN npm i -g mjml@^3.0
RUN npm i -g bower
RUN npm i -g yarn

# COPY package.json /app/package.json
# COPY yarn.lock /app/yarn.lock
#
# RUN yarn install

COPY . /app
