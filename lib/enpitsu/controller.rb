module Enpitsu
  class Controller
    extend Forwardable

    delegate [:load_path] => :@model

    def initialize(slot)
      @view = View.new(slot, self)
      @model = Model.new
      @model.add_observer(@view)
    end

    def previous_image
      return unless @model.index_valid?(:previous)
      @model.previous_image
    end

    # clear when new browse
    # copy/paste
    # generate
    # backup

    def next_image
      return unless @model.index_valid?(:next)
      @model.next_image
    end

    def update_meta(type, data)
      @model.send("update_#{type}", data)
    end
  end
end
