class Ecm::Pictures::Backend::PicturesController < Itsf::Backend::Resource::BaseController
  module ColumnsHashFix
    extend ActiveSupport::Concern
    
    included do
      before_action :fix_columns_hash, only: [:update]
    end

    private

    def fix_columns_hash
      # @todo Find out what is causing the loss of columns in columns_hash
      resource_class.reset_column_information
    end
  end

  include ColumnsHashFix

  def self.resource_class
    Ecm::Pictures::Picture
  end

  private

  def collection_scope
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

    p = processed_params.require(:picture).permit(:gallery_id, :name, :markup_language, :description, :tag_list, :image)

    if image_base64.present?
      p.merge(image: extract_image_base64(image_base64) ) 
    else
      p
    end
  end
end
