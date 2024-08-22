Rails.application.routes.draw do
  get "movies" => "movies#index"
  post "admin/movies" => "admin/movies#create"
  get "admin/movies" => "admin/movies#index"
  get "admin/movies/new" => "admin/movies#new"
  get "admin/movies/:id" => "admin/movies#edit"
  put "admin/movies/:id" => "admin/movies#update"
end
