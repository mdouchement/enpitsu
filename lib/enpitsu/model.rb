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

    def previous_image
      @index -= 1
      notify
    end

    def next_image
      @index += 1
      notify
    end

    def index_valid?(action)
      case action
      when :previous
        index = @index - 1
      when :next
        index = @index + 1
      end
      index > -1 && index < @metadata.nb_of_images
    end

    def update_gallery_headers(value)
      @metadata.update_attributes(value)
    end

    def update_image(value)
      @metadata.update_attributes(value, @index)
    end

    def copy
      @clipboard = current_image.deep_dup.tap do |h|
        h.delete(:filename)
      end
    end

    def paste
      update_image(@clipboard)
      notify
    end

    private

    def notify
      changed
      notify_observers(self)
    end
  end
end
