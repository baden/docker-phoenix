FROM baden/elixir
MAINTAINER Denys Batrak baden.i.ua@gmail.com

RUN mkdir /node && \
    cd /node && \
    curl -O https://nodejs.org/dist/v4.4.7/node-v4.4.7-linux-x64.tar.xz && \
    tar xf ./node-v4.4.7-linux-x64.tar.xz && \
    rm ./node-v4.4.7-linux-x64.tar.xz

ENV PATH /node/node-v4.4.7-linux-x64/bin/:${PATH}

RUN mkdir /app
WORKDIR /app

RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force


ARG PORT=4000
ENV PORT=${PORT}

EXPOSE ${PORT}

CMD ["bash"]
