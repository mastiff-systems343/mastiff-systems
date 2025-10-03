FROM ruby:3.2.9-slim

WORKDIR /app

RUN apt-get update && apt-get install -y build-essential libvips curl && rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./

# Install the correct bundler version
RUN gem install bundler:2.7.2

RUN bundle install

COPY . .

# Build the site first
RUN bundle exec jekyll build

EXPOSE 4000

# Serve with livereload disabled and incremental builds
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4000", "--skip-initial-build", "--no-watch"]