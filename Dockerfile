FROM ruby:3.2.6-slim

WORKDIR /app

RUN apt-get update && apt-get install -y build-essential libvips curl && rm -rf /var/lib/apt/lists/*

COPY . .

RUN bundle install

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4000"]
