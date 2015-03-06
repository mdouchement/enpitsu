require 'enpitsu/metadata_modules/loader'

module Enpitsu
  class Metadata
    include MetadataModules::Loader

    def initialize(path)
      @path = path
      @buffer = init_metadata
    end

    def gallery_headers
      { title: @buffer[:title], description: @buffer[:description] }
    end

    def image(index)
      @buffer[:images][index]
    end
  end
end
