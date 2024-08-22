class Admin::MoviesController < ApplicationController
  def index
  end

  def new
  end

  def create
    
    
    # @movie = Movie.new(
    #   name: params[:name], year: params[:year],
    #   description: params[:description],
    #   image_url: params[:movie[:image_url]], is_showing: params[movie: is_showing]
    #   )
    @movie = Movie.new(
      name: params[:movie][:name],
      year: params[:movie][:year],
      description: params[:movie][:description],
      image_url: params[:movie][:image_url],
      is_showing: params[:movie][:is_showing]
      )

    if @movie.save
      redirect_to("/admin/movies")
    else
      flash[:notice] = @movie.errors.full_messages
      redirect_to("/admin/movies")
    end
  end
end
