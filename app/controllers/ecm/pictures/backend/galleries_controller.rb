class Ecm::Pictures::Backend::GalleriesController < Itsf::Backend::Resource::BaseController
  include ResourcesController::Sorting
  include ResourcesController::ActsAsListConcern
  include ResourcesController::ActsAsPublishedConcern

  def self.resource_class
    Ecm::Pictures::Gallery
  end

  private

  def permitted_params
    params
      .require(:gallery)
      .permit(:name, :markup_language, :description, :link_images, :tag_list, :published, picture_images: [])
  end
end
