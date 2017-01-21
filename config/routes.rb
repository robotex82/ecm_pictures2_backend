Ecm::Pictures::Backend::Engine.routes.draw do
  backend_resources :galleries
  backend_resources :pictures

  root to: 'home#index'
end
