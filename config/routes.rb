Rails.application.routes.draw do
  root "songs#index"
  delete '/songs/:id', to: 'songs#destroy', as: 'delete_song'
  resources :songs, except: [:destroy]

end
