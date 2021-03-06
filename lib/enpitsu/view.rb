require 'enpitsu/view_modules/template'
require 'enpitsu/view_modules/action_register'

module Enpitsu
  class View
    include ViewModules::Template
    include ViewModules::ActionRegister
    extend Forwardable

    delegate %i(previous_image next_image update_meta copy paste generate) => :@controller

    def initialize(slot, controller)
      @slot = slot
      @controller = controller
      init_view
      init_actions
    end

    def browse
      ask_open_folder.tap do |path|
        @controller.load_path(path)
      end
    end

    def update(model)
      path_field.text = model.path
      model.gallery_headers.tap do |headers|
        gallery_title_field.text = headers[:title]
        gallery_description_field.text = headers[:description]
      end
      model.current_image.tap do |image|
        image_title_field.text = image[:title]
        image_description_field.text = image[:description]
        image_filename_field.text = image[:filename]
        canvas_field.path = File.join(model.path, image[:filename])
      end
    end
  end
end
