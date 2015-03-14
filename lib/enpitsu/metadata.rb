require 'json'
require 'enpitsu/metadata_modules/loader'

module Enpitsu
  class Metadata
    include Celluloid
    include MetadataModules::Loader

    def initialize(path)
      @path = path
      @buffer = init_metadata
      backup
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

    def generate(filename = 'metadata.json')
      File.open(File.join(@path, filename), 'w') do |file|
        STDOUT.puts "Generate #{file.path}"
        file << JSON.pretty_generate(@buffer)
      end
    end

    private

    def backup
      puts 'Start backup timer'
      every(5.minutes) do
        generate("metadata_backup_#{Time.now.utc.strftime('%Y%m%d%H%M%S')}.json")
      end
    end
  end
end
