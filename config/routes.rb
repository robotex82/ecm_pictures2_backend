Ecm::Pictures::Backend::Engine.routes.draw do
  resources :picture_galleries
  resources :pictures

  root to: 'home#index'
end
