FROM ruby:2.4.1

ENV APP_ROOT /app
ENV BUNDLE_PATH /usr/local/bundle

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs

# Creates a non-root user
RUN useradd -d /home/luis -m -s /bin/bash luis && echo "luis:luis" | chpasswd && adduser luis sudo

WORKDIR $APP_ROOT
ADD . $APP_ROOT

# Make the files owned by luis
RUN chown -R luis:luis /app

# Switch to your new user in docker image
USER luis

