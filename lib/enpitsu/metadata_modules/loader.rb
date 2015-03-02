module Enpitsu
  module MetadataModules
    module Loader
      def init_metadata
        if file?
          load_from_file
        else
          new_one
        end
      end

      private

      def load_from_file
        #TODO
      end

      def new_one
        {
          title: '',
          description: '',
          images: load_images
        }
      end

      def load_images
        Dir.glob(File.join @path, '*.jpg').each_with_object([]) do |file, images|
          images << { filename: file, title: '', description: '' }
        end
      end

      def file?
        valid = File.exist?(File.join @path, 'metadata.txt')
        valid || File.exist?(File.join @path, 'metadata.json')
      end
    end
  end
end
