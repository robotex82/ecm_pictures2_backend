Ecm::Pictures::Backend::Engine.routes.draw do
  resources :galleries
  resources :pictures

  root to: 'home#index'
end
