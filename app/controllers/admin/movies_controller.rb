class Admin::MoviesController < ApplicationController
  #rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  def record_not_found
    render "admin/movies/400", status: 400
  end


  def index
  end

  def new
  end

  def create
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
      redirect_to("/admin/movies/new")
    end
  end

  def edit
    @movie = Movie.find_by(id: params[:id])
  end

  def update
    @movie = Movie.find_by(id: params[:id])
    if @movie
      @movie.name = params[:movie][:name]
      @movie.year = params[:movie][:year]
      @movie.description = params[:movie][:description]
      @movie.image_url = params[:movie][:image_url]
      @movie.is_showing = params[:movie][:is_showing]
      @movie.save
      redirect_to("/admin/movies")
    else
      flash[notice] = @movie.errors.full_messages
      render "admin/movies/edit"
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    #@movie = Movie.find_by(id: params[:id])
    @movie.destroy
    redirect_to("/admin/movies/index")
  end
end
