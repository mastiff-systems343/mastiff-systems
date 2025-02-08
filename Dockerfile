FROM ruby:3.2.6-slim

WORKDIR /app

# Install required packages
RUN apt-get update && apt-get install -y build-essential libvips curl && \
    rm -rf /var/lib/apt/lists/*

# Copy the app files and install gems
COPY . .
RUN bundle install

# Build the site with Jekyll
RUN bundle exec jekyll build

# Serve the site dynamically
EXPOSE 4000
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4000"]
