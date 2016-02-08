class Ecm::Pictures::Backend::PictureGalleriesController < Itsf::Backend::Resource::BaseController
  def self.resource_class
    Ecm::Pictures::PictureGallery
  end

  private

  def permitted_params
    params
      .require(:ecm_pictures_picture_gallery)
        .permit(:name, :markup_language, :description, :link_images, picture_images: [])
  end
end
