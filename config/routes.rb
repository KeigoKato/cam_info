Rails.application.routes.draw do

  devise_for :users
  root "pictures#index"

  resources :pictures do
    resources :exifs, only: [:edit, :update]
  end

  resources :tags, only: :index

  post "/likes/:picture_id/create" => "likes#create"

end
