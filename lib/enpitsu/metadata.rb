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

    def update_attributes(value, index = nil)
      if index
        @buffer[:images][index].merge!(value)
      else
        @buffer.merge!(value)
      end
    end

    def nb_of_images
      @nb_of_images ||= @buffer[:images].length
    end
  end
end
