require 'enpitsu/view_modules/template'
require 'enpitsu/view_modules/action_register'

module Enpitsu
  class View
    include ViewModules::Template
    include ViewModules::ActionRegister

    def initialize(slot, controller)
      @slot = slot
      @controller = controller
      init_view
      init_actions
    end

    def browse
      ask_open_folder.tap do |path|
        path_field.text = path
        @controller.load_path(path)
      end
    end
  end
end
