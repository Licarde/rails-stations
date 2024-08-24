Rails.application.routes.draw do
  get 'sheets/sheets'
  get "movies" => "movies#index"
  get "movies/search" => "movies#search"
  post "admin/movies" => "admin/movies#create"
  get "admin/movies" => "admin/movies#index"
  get "admin/movies/new" => "admin/movies#new"
  get "admin/movies/:id" => "admin/movies#edit"
  post "admin/movies/:id" => "admin/movies#destroy"
  delete "admin/movies/:id" => "admin/movies#destroy"
  put "admin/movies/:id" => "admin/movies#update"
  get "sheets" => "sheets#index"
  get "movies/:id" => "movies#show"
end
