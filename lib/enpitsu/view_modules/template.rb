module Enpitsu
  module ViewModules
    module Template
      attr_accessor :path_field, :browse_btn,
                    :gallery_title_field, :gallery_description_field, :validate_btn,
                    :image_title_field, :image_description_field, :copy_btn, :paste_btn,
                    :previrous_btn, :next_btn, :generate_btn,
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
                @gallery_title_field = edit_box width: 1.0
                inscription "Gallery's description:", margin: 2
                @gallery_description_field = edit_line width: 1.0
                @validate_btn = button 'Validate', right: true
              end

              flow do
                tagline '' # Ugly top margin
                inscription "Image's title:", margin: 2
                @image_title_field = edit_line width: 1.0
                inscription "Image's comment:", margin: 2
                @image_description_field = edit_box width: 1.0
                @copy_btn = button 'Copy'
                @paste_btn = button 'Paste'
                @previrous_btn = button 'Previous'
                @next_btn = button 'Next'
              end

              flow do
                tagline '' # Ugly top margin
                @generate_btn = button 'Generate'
              end
            end

            flow width: 0.7, height: 1.0, margin: 8 do
              @image_filename_field = inscription 'img_56.jpg'
              @canvas_field = image 'http://www.troll.me/images/coolstorybrotell/cool-story-bro.jpg'
            end
          end
        end
      end
      # rubocop:enable Metrics/AbcSize
    end
  end
end
