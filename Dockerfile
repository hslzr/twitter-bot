FROM ruby:2.5.1-slim
LABEL maintainer "Héctor Salazar <hector@hslzr.com>"

RUN apt-get update
RUN apt-get install build-essential -y --no-install-recommends

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install -j10

COPY . .

CMD ["ruby", "bot.rb"]
