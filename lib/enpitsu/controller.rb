module Enpitsu
  class Controller
    # extend Forwardable
    # delegate [:path] => :@model

    def initialize(slot)
      @view = View.new(slot, self)
      @model = Model.new
      @model.add_observer(@view)
    end

    def load_path(path)
      @model.load_path(path)
    end
  end
end
