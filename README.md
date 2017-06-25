# Sample twitter bot

Real, real simple.

## How to setup

You need to [create a twitter app](https://apps.twitter.com/) and setup your consumer/access tokens in the **Keys and Access Tokens** section. Add those keys in the **bot.rb** file and you're ready to go.

Install docker in order to run it as a docker container, or just run it locally

### Running locally

```shell
$ bundle install
# ...

$ ruby bot.rb
```

### Running as a docker container

```shell
# Build your image with whatever name you choose
# In this example, 'the-bot'
$ docker build -t the-bot:latest .

# Run it
$ docker run -it --rm the-bot:latest
```

Aaaand done. Updates on this shortly.

Also, please, don't do anything illegal or something.


