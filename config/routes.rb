Rails.application.routes.draw do
  resources :troquels do
    collection do
      post :import
    end
  end

  root "troquels#index"
end
