FROM ruby:3.2.9-slim

WORKDIR /app

# Install build tools and dependencies
RUN apt-get update && apt-get install -y build-essential libvips curl && rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./

# Install the exact Bundler version from Gemfile.lock
RUN gem install bundler:2.5.21

# Debug: confirm Ruby + Bundler version at build time
RUN ruby -v && bundler -v

# Install gems with pinned bundler
RUN bundle _2.5.21_ install

COPY . .

EXPOSE 4000

# Run Jekyll with the pinned Bundler
CMD ["bundle", "_2.5.21_", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4000", "--verbose"]
