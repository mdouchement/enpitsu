require 'enpitsu/metadata'

module Enpitsu
  class Model
    attr_accessor :path

    def load_path
      @metadata = Metadata.new(path)
    end
  end
end
