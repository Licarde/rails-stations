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
end 