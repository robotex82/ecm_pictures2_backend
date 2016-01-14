Ecm::Pictures::Backend.configure do |config|  
  # Set the resources, that will be shown in the backend menu in development
  # mode. This needs to be set to get a correct menu because
  # Controller.descendants is empty in development. This is an eager load
  # issue.
  # 
  # Default: config.registered_controllers = -> {[
  #            Ecm::Pictures::Backend::PictureGalleriesController,
  #            Ecm::Pictures::Backend::PicturesController
  #          ]}
  # 
  config.registered_controllers = -> {[
    Ecm::Pictures::Backend::PictureGalleriesController,
    Ecm::Pictures::Backend::PicturesController
  ]}
end