Rails.application.routes.draw do
  root "pictures#index"
  resources :pictures do
    resources :exifs, only: [:edit, :update]
  end
end
