Ecm::Pictures::Backend::Engine.routes.draw do
  backend_resources :galleries do
    post :reposition, on: :member
    post :toggle_published, on: :member
  end
  backend_resources :pictures do
    post :reposition, on: :member
    post :toggle_published, on: :member
  end

  root to: 'home#index'
end
