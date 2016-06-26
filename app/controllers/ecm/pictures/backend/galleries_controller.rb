class Ecm::Pictures::Backend::GalleriesController < Itsf::Backend::Resource::BaseController
  def self.resource_class
    Ecm::Pictures::Gallery
  end

  private

  def permitted_params
    params
      .require(:ecm_pictures_gallery)
      .permit(:name, :markup_language, :description, :link_images, :tag_list, picture_images: [])
  end
end
