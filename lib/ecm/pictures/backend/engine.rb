module Ecm
  module Pictures
    module Backend
      class Engine < ::Rails::Engine
        isolate_namespace Ecm::Pictures::Backend

        initializer "ecm_pictures_backend.asset_pipeline" do |app|
          app.config.assets.precompile << 'ecm_pictures_backend.js'
          app.config.assets.precompile << 'ecm_pictures_backend.css'
        end
      end
    end
  end
end
