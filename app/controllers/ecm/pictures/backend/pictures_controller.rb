module Ecm
  module Pictures
    module Backend
      class PicturesController < Itsf::Backend::Resource::BaseController
        include ResourcesController::Sorting
        include ResourcesController::ActsAsListConcern
        include ResourcesController::ActsAsPublishedConcern

        def self.resource_class
          Ecm::Pictures::Picture
        end

        private

        def load_collection_scope
          super.includes(:gallery)
        end

        def extract_image_base64(encoded_image)
          decoded_image = Base64.decode64(encoded_image.gsub(/^data\:image\/\w+\;base64\,/, '')).force_encoding('UTF-8')
          content_type = encoded_image.split(';').first.split(':').last
          basename = 'image'
          extension = '.jpg'

          image = Tempfile.new([basename, extension])
          image.write decoded_image
          image.rewind
          image
        end

        def permitted_params
          processed_params = params.deep_dup
          image_base64 = processed_params[:picture].try(:delete, :image_base64)

          p = processed_params.require(:picture).permit(:gallery_id, :name, :markup_language, :description, :tag_list, :image, :published)

          if image_base64.present?
            p.merge(image: extract_image_base64(image_base64))
          else
            p
          end
        end
      end
    end
  end
end
