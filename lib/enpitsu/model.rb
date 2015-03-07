require 'enpitsu/metadata'

module Enpitsu
  class Model
    include Observable
    extend Forwardable
    attr_accessor :path

    delegate [:gallery_headers] => :@metadata

    def load_path(path)
      @path = path
      @index = 0
      @metadata = Metadata.new(path)
      notify
    end

    def current_image
      @metadata.image(@index)
    end

    private

    def notify
      changed
      notify_observers(self)
    end
  end
end
