require "middleman-core"

module Middleman
  class Tinify < Extension
    option :key, nil, 'API key for api.tinify.com'
    option :proxy, nil, 'Proxy settings to access tinify.com service (optional)'
    option :path, nil, 'Path to images to tinify, defaults to :images_dir if not set'

    def initialize(app, options_hash={}, &block)
      super
      require 'tinify'

      ::Tinify.key = options.key
      ::Tinify.proxy = options.proxy if options.proxy
    end

    def after_build(builder)
      source_dir = File.join(app.config[:build_dir], options.path || app.config[:images_dir])
      prefix = app.config[:build_dir] + File::SEPARATOR

      files = Dir[File.join(source_dir, "**", "*.{jpg,jpeg,png}")]

      files.each do |file|
        ::Tinify.from_file(file).to_file(file)

        builder.thor.say_status :tinified, file.sub(prefix, "")
      end
    end
  end
end

Middleman::Extensions.register(:tinify) { Middleman::Tinify }
