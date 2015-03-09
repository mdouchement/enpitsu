module Enpitsu
  module ViewModules
    module ActionRegister
      def init_actions
        %i(browse copy paste generate).each do |action|
          send("#{action}_btn").click { send action }
        end
        previous_btn.click { previous_image }
        next_btn.click { next_image }

        gallery_title_field.change { |f| update_meta(:gallery_headers, title: f.text) }
        gallery_description_field.change { |f| update_meta(:gallery_headers, description: f.text) }
        image_title_field.change { |f| update_meta(:image, title: f.text) }
        image_description_field.change { |f| update_meta(:image, description: f.text) }
      end
    end
  end
end
