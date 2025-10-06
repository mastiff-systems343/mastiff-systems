FROM ruby:3.2.9-slim

WORKDIR /app

# Install build tools and dependencies
RUN apt-get update && apt-get install -y build-essential libvips curl && rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./

# Install the correct Bundler version (matching your Gemfile.lock)
RUN gem install bundler:2.5.21

# Install gems using the pinned bundler version
RUN bundle _2.5.21_ install

COPY . .

EXPOSE 4000

# Run Jekyll with the pinned bundler version
CMD ["bundle", "_2.5.21_", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4000", "--verbose"]
