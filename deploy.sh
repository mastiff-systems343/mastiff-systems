#!/bin/bash
echo "Starting Jekyll server on port ${PORT:-8080}"
bundle exec jekyll serve --host 0.0.0.0 --port ${PORT:-8080} --trace
