module Enpitsu
  module ViewModules
    module ActionRegister
      def init_actions
        browse_btn.click { browse }
        gallery_title_field.change { |f| update_meta(:gallery_headers, title: f.text) }
        gallery_description_field.change { |f| update_meta(:gallery_headers, description: f.text) }
        image_title_field.change { |f| update_meta(:image, title: f.text) }
        image_description_field.change { |f| update_meta(:image, description: f.text) }
        previous_btn.click { previous_image }
        next_btn.click { next_image }
        copy_btn.click { copy }
        paste_btn.click { paste }
      end
    end
  end
end
