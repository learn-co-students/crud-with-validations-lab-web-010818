Rails.application.routes.draw do

  resources :songs, only: [:show, :index, :new, :create, :update, :edit]


end
