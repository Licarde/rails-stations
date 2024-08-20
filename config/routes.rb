Rails.application.routes.draw do
  get "movies" => "movies#index"
  get "admin/movies" => "admin/movies#index"
  post "admin/movies" => "admin/movies#create"
  get "admin/movies/new" => "admin/movies#new"
end
