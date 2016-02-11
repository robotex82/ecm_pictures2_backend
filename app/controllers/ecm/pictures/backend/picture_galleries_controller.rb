class Ecm::Pictures::Backend::PictureGalleriesController < Itsf::Backend::Resource::BaseController
  def self.resource_class
    Ecm::Pictures::PictureGallery
  end

  private

  def permitted_params
    # raise params.inspect
    picture_images_base_64 = params[:ecm_pictures_picture_gallery].delete(:picture_images_base_64)
    picture_images = picture_images_base_64.collect do |data|
      Tempfile.new(['image', '.jpg']).tap do |t|
        t.write(Base64.decode64(data.gsub(/^data\:image\/\w+\;base64\,/, '')).force_encoding('UTF-8'))
        t.rewind
      end
    end
    # raise picture_images.inspect
    p = params.require(:ecm_pictures_picture_gallery).permit(:name, :markup_language, :description, :link_images, :tag_list, picture_images: [])
    if picture_images.any?
      p.merge(picture_images: picture_images)
    else
      p
    end
  end
end
