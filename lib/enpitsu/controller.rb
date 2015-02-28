module Enpitsu
  class Controller
    def initialize(slot)
      @view = View.new(slot)
    end
  end
end
