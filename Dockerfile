FROM elixir:1.6-alpine as builder

WORKDIR /demo_project

ENV MIX_ENV=test

# Copy mix files so we use distillery:
COPY mix.exs mix.lock ./

COPY config config

COPY apps apps

RUN mix do \
      local.hex --force, \
      local.rebar --force,\
      deps.get, \
      deps.compile

RUN mix dialyzer --halt-exit-status
RUN mix test

RUN rm -rf ./deps

ENV MIX_ENV=prod

RUN apk add --update \
            bash \
            git \
            nodejs \
            nodejs-npm \
            openssl

RUN mix do \
      local.hex --force, \
      local.rebar --force,\
      deps.get, \
      deps.compile

WORKDIR /demo_project/apps/demo_aph/assets
RUN npm install && ./node_modules/brunch/bin/brunch build --production

WORKDIR /demo_project/apps/demo_aph
RUN MIX_ENV=prod mix phx.digest

WORKDIR /demo_project
COPY rel rel
RUN mix release --env=prod --verbose

FROM alpine:3.8

RUN apk add --update \
            bash \
            openssl

ENV PORT=4000 \
    MIX_ENV=prod \
    REPLACE_OS_VARS=true \
    SHELL=/bin/bash

COPY --from=builder /demo_project/_build/prod/rel/demo_project/releases/0.1.0/demo_project.tar.gz .

RUN tar zxf demo_project.tar.gz && rm demo_project.tar.gz

RUN chown -R root ./releases

EXPOSE 4000
USER root

CMD ["./bin/demo_project", "foreground"]