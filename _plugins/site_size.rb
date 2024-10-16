module Jekyll
  class SiteSizeGenerator < Generator
    def generate(site)
      total_size = 0
      Dir.glob(File.join(site.dest, '**', '*')).each do |file|
        total_size += File.size(file) if File.file?(file)
      end
      # Add the total size in bytes to the site data
      site.config['total_size'] = total_size
    end
  end
end
