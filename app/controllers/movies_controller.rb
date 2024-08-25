class MoviesController < ApplicationController

  def index
    @movie = Movie.all
    
    if params[:type] == 1
      @movie = @movie.where(is_showing: false)
    elsif params[:type] ==2
      @movie = @movie.where(is_showing: true)
    end

    if params[:keyword]
      @movie = @movie.where('name LIKE ?', "%#{params[:keyword]}%")
           .or(@movie.where('description LIKE ?', "%#{params[:keyword]}%"))
    end
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    @schedules = Schedule.where(movie_id: params[:id])
  end

  def reservation
    @sheets = Sheet.all
    if params[:schedule_id].nil? || params[:date].nil?
      redirect_to("/movies/#{params[:movie_id]}")
    end
  end
end
