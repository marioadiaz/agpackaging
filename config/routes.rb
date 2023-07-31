Rails.application.routes.draw do
  
  resources :troquels do
    collection { post :import }
  end
  
  root "troquels#index"
end
