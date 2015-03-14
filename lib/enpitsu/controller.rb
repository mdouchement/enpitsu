module Enpitsu
  class Controller
    extend Forwardable

    delegate %i(load_path copy paste generate) => :@model

    def initialize(slot)
      @view = View.new(slot, self)
      @model = Model.new
      @model.add_observer(@view)
    end

    def previous_image
      return unless @model.index_valid?(:previous)
      @model.previous_image
    end

    def next_image
      return unless @model.index_valid?(:next)
      @model.next_image
    end

    def update_meta(type, data)
      @model.send("update_#{type}", data)
    end
  end
end
