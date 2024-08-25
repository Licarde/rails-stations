Rails.application.routes.draw do
  get "movies" => "movies#index"
  get "movies/search" => "movies#search"
  get "movies/:id" => "movies#show"
  
  get "sheets" => "sheets#index"

  post "admin/movies" => "admin/movies#create"
  get "admin/movies" => "admin/movies#index"
  get "admin/movies/new" => "admin/movies#new"
  get "admin/movies/:id" => "admin/movies#edit"
  post "admin/movies/:id" => "admin/movies#destroy"
  delete "admin/movies/:id" => "admin/movies#destroy"
  put "admin/movies/:id" => "admin/movies#update"

  get "admin/schedules" => "admin/schedules#index"
  get "admin/schedules/:id" => "admin/schedules#edit"
  #get "admin/schedules/:id/schedules/new" => "admin/schedules#new"
  put "admin/schedules/:id" => "admin/schedules#update"
  delete "admin/schedules/:id" => "admin/schedules#destroy"
  #post "admin/schedules/:id" => "admin/schedules#destroy"
  
end
