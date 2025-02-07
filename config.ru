# config.ru for dynamic Jekyll
require 'rack'
require 'jekyll'
require 'webrick'

Jekyll.logger.log_level = :error  # Adjust log level as needed

# Build the site on startup
puts "Building Jekyll site..."
Jekyll::Commands::Build.process

# Configure Rack to serve static and dynamic pages
app = Rack::Builder.new do
  map "/" do
    use Rack::CommonLogger
    run Rack::File.new(File.expand_path("_site"))
  end
end

run app
