Ecm::Pictures::Backend.configure do |config|
  # Set the resources, that will be shown in the backend menu.
  #
  # Default: config.registered_controllers = -> {[
  #            Ecm::Pictures::Backend::GalleriesController,
  #            Ecm::Pictures::Backend::PicturesController
  #          ]}
  #
  config.registered_controllers = lambda {
    [
      Ecm::Pictures::Backend::GalleriesController,
      Ecm::Pictures::Backend::PicturesController
    ]
  }

  # Set the services, that will be shown in the backend menu.
  #
  # Default: config.registered_services = -> {[]}
  #
  config.registered_services = -> { [] }

  # Enables HTML 5 camera support for taking pictures inside the
  # picture new action.
  #
  # Default: config.enable_html5_camera_support = false
  #
  config.enable_html5_camera_support = false
end
