require 'enpitsu/metadata_modules/loader'

module Enpitsu
  class Metadata
    include MetadataModules::Loader

    def initialize(path)
      @path = path
      @buffer = init_metadata
    end
  end
end
