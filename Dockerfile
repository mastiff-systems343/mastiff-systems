# Use Ruby 3.2.6 or the desired Ruby version
ARG RUBY_VERSION=3.2.6
FROM registry.docker.com/library/ruby:$RUBY_VERSION-slim as base

# Set working directory
WORKDIR /app

# Install dependencies needed for Jekyll and other gems
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    git \
    libvips \
    curl && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install --jobs 4 --retry 3

# Copy application code to the container
COPY . .

# Expose port 4000 for Jekyll server
EXPOSE 4000

# Command to serve the Jekyll site
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4000"]
