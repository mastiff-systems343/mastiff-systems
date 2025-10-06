FROM ruby:3.2.9-slim

WORKDIR /app

RUN apt-get update && apt-get install -y build-essential libvips curl && rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./

# Install the correct bundler version
RUN gem install bundler:2.7.2

RUN bundle install

COPY . .

EXPOSE 4000

# Use verbose output to see what's happening
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4000", "--verbose"]