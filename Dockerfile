FROM ruby:3.1.0-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    postgresql-client \
    git \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /usr/src/app
COPY Gemfile* /usr/src/app/
RUN gem install bundler
RUN bundle install
COPY . /usr/src/app


EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]