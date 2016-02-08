class Ecm::Pictures::Backend::PicturesController < Itsf::Backend::Resource::BaseController
  def self.resource_class
    Ecm::Pictures::Picture
  end

  private

  def permitted_params
    params
      .require(:ecm_pictures_picture)
        .permit(:picture_gallery_id, :name, :markup_language, :description, :image, :tag_list)
  end
end
