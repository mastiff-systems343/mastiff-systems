FROM registry.docker.com/library/ruby:3.2.6

WORKDIR /app

RUN apt-get update && apt-get install -y build-essential libvips curl && \
    rm -rf /var/lib/apt/lists/*

COPY . .

RUN bundle install --jobs 4 --retry 3

EXPOSE 9292  # Default Rack port
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "--port", "9292"]
