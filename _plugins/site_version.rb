Jekyll::Hooks.register :site, :pre_render do |site|
  site.config["jekyll_version"] = Jekyll::VERSION
end
