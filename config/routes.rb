Rails.application.routes.draw do

  devise_for :users
  root "pictures#index"

  resources :pictures do
    resources :exifs, only: [:edit, :update]
  end

  resources :tags, only: :index
  get "/tags/search" => "tags#search"

  resources :users, only: :show

  post "/likes/:picture_id/create" => "likes#create"

  post "/likes/:picture_id/destroy" => "likes#destroy"

end
