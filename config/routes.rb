Rails.application.routes.draw do
  resources :song_lists
  resources :songs
  resources :artists
  resources :playlists
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
