require 'enpitsu/metadata'

module Enpitsu
  class Model
    attr_accessor :path

    def load_path
      @matadata = Metadata.new(path)
    end
  end
end
