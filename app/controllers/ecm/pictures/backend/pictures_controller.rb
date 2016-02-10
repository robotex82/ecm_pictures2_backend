class Ecm::Pictures::Backend::PicturesController < Itsf::Backend::Resource::BaseController
  def self.resource_class
    Ecm::Pictures::Picture
  end

  private

  def request_includes_base64_image?
    params[:ecm_pictures_picture].key?(:image_base64)
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
    image_base64 = processed_params[:ecm_pictures_picture].try(:delete, :image_base64)
    if image_base64.present?
      image = extract_image_base64(image_base64) 
      processed_params[:ecm_pictures_picture].merge!(image: image)
    end
    processed_params.require(:ecm_pictures_picture)
                      .permit(:picture_gallery_id, :name, :markup_language, :description, :image, :tag_list)
  end
end
