class Ecm::Pictures::Backend::PicturesController < Itsf::Backend::Resource::BaseController
  def self.resource_class
    Ecm::Pictures::Picture
  end

  private

  def request_includes_base64_image?
    params[:ecm_pictures_picture].has_key?(:image_base64) && params[:ecm_pictures_picture][:image_base64].present?
  end

  def extract_base64
    encoded_image = params[:ecm_pictures_picture].delete(:image_base64)
    decoded_image = Base64.decode64(encoded_image.gsub(/^data\:image\/\w+\;base64\,/, '')).force_encoding('UTF-8')
    content_type = encoded_image.split(";").first.split(":").last
    basename = "image"
    extension = ".jpg"

    image = Tempfile.new([basename, extension])
    image.write decoded_image
    image.rewind
    image
  end

  def permitted_params
    permitted_params = params
      .require(:ecm_pictures_picture)
        .permit(:picture_gallery_id, :name, :markup_language, :description, :image, :tag_list)
    permitted_params.merge(image: extract_base64) if request_includes_base64_image?
  end
end
