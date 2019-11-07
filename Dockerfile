FROM ruby:2.6.5
RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs npm
RUN npm install -g yarn
WORKDIR /app
COPY ./src/Gemfile /app/Gemfile
COPY ./src/Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY ./src /app