Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :hospitals, only: :show do
    resources :doctors, only: :show do
      resources :patients, only: :destroy
    end
  end
end
