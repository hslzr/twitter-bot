FROM ruby:2.5.1-slim
LABEL maintainer "Salazar <salazar@hslzr.com>"

RUN apt-get -qqq update && apt-get -qqq install build-essential -y --no-install-recommends

RUN mkdir -p /usr/src/bot

WORKDIR /usr/src/bot

COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install -j10

COPY . .

CMD ["ruby", "bot.rb"]
