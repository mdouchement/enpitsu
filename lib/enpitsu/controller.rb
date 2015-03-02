module Enpitsu
  class Controller
    extend Forwardable
    delegate [:path] => :@model

    def initialize(slot)
      @view = View.new(slot, self)
      @model = Model.new
    end

    def load_path(path)
      @model.path = path
      @model.load_path
    end
  end
end