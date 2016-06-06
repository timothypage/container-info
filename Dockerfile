FROM ruby:2.3.1-alpine
RUN mkdir /app
WORKDIR /app

# copy the gem information first,
# if this doesn't change then bundle install will be cached
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

ADD . /app

# webrick default port
EXPOSE 9292

CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0"]
