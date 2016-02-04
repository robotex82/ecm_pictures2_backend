Ecm::Pictures::Backend.configure do |config|  
  # Set the resources, that will be shown in the backend menu.
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

  # Set the services, that will be shown in the backend menu.
  # 
  # Default: config.registered_services = -> {[]}
  # 
  config.registered_services = -> {[]}
end