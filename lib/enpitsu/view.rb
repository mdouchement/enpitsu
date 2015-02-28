module Enpitsu
  class View
    def initialize(slot)
      @slot = slot
      init_view
    end

    def init_view
      @slot.app do
        flow width: 1.0, margin: 6 do
          inscription "Gallery's path:"
          edit_line width: 0.9
          button 'Browse'
        end

        flow width: 1.0, height: 0.9, margin: 6 do
          flow width: 0.3, height: 1.0 do

            flow do
              inscription '' # Ugly top margin
              inscription "Gallery's title:", margin: 2
              edit_box width: 1.0
              inscription "Gallery's comment:", margin: 2
              edit_line width: 1.0
              button 'Validate', right: true
            end

            flow do
              tagline '' # Ugly top margin
              inscription "Image's title:", margin: 2
              edit_line width: 1.0
              inscription "Image's comment:", margin: 2
              edit_box width: 1.0
              button 'Copy'
              button 'Paste'
              button 'Previous'
              button 'Next'
            end

            flow do
              tagline '' # Ugly top margin
              button 'Generate'
            end
          end

          flow width: 0.7, height: 1.0, margin: 8 do
            inscription 'img_56.jpg'
            image 'http://www.troll.me/images/coolstorybrotell/cool-story-bro.jpg'
          end
        end
      end
    end
  end
end
