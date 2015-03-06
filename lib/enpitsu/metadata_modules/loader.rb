require 'json'

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
        JSON.parse(File.read(File.join @path, 'metadata.json')).tap do |buffer|
          buffer.deep_symbolize_keys!

          existing_images = load_images
          buffer[:images].reject! { |image| !existing_images.include?(image[:filename]) }

          images = buffer[:images].flat_map { |image| image[:filename] }
          existing_images.each do |image|
            next if images.include?(image)
            buffer[:images] << build_image(image)
          end
          buffer[:images].sort_by! { |image| image[:filename] }
        end
      end

      def new_one
        {
          title: '',
          description: '',
          images: build_images_metadata
        }
      end

      def build_images_metadata
        load_images.each_with_object([]) do |file, images|
          images << build_image(file)
        end
      end

      def build_image(file)
        { filename: file, title: '', description: '' }
      end

      def load_images
        Dir.glob(File.join @path, '*.jpg').sort.map { |file| file.split(File::SEPARATOR).last }
      end

      def file?
        valid = File.exist?(File.join @path, 'metadata.txt')
        valid || File.exist?(File.join @path, 'metadata.json')
      end
    end
  end
end
