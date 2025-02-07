#!/bin/bash
echo "Starting Deployment Script"
bundle install --verbose || exit 1
bundle exec jekyll serve --host 0.0.0.0 --port $PORT --trace || exit 1
