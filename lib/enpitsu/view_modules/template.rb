module Enpitsu
  module ViewModules
    module Template
      attr_accessor :path_field, :browse_btn,
                    :gallery_title_field, :gallery_description_field,
                    :image_title_field, :image_description_field, :copy_btn, :paste_btn,
                    :previous_btn, :next_btn, :generate_btn,
                    :image_filename_field, :canvas_field

      # rubocop:disable Metrics/AbcSize
      def init_view
        main = self
        @slot.app do
          flow width: 1.0, margin: 6 do
            inscription "Gallery's path:"
            main.path_field = edit_line width: 0.9
            main.browse_btn = button 'Browse'
          end

          flow width: 1.0, height: 0.9, margin: 6 do
            flow width: 0.3, height: 1.0 do
              flow do
                inscription '' # Ugly top margin
                inscription "Gallery's title:", margin: 2
                main.gallery_title_field = edit_line width: 1.0
                inscription "Gallery's description:", margin: 2
                main.gallery_description_field = edit_box width: 1.0
              end

              flow do
                tagline '' # Ugly top margin
                inscription "Image's title:", margin: 2
                main.image_title_field = edit_line width: 1.0
                inscription "Image's comment:", margin: 2
                main.image_description_field = edit_box width: 1.0
                main.copy_btn = button 'Copy'
                main.paste_btn = button 'Paste'
                main.previous_btn = button 'Previous'
                main.next_btn = button 'Next'
              end

              flow do
                tagline '' # Ugly top margin
                main.generate_btn = button 'Generate'
              end
            end

            flow width: 0.7, height: 1.0, margin: 8 do
              main.image_filename_field = inscription 'oawsooo.png'
              main.canvas_field = image File.join(Enpitsu.pwd, '..', 'data', 'oawsooo.png')
            end
          end
        end
      end
      # rubocop:enable Metrics/AbcSize
    end
  end
end
