class ReservationsController < ApplicationController
  def new
    if params[:date].nil? || params[:sheet_id].nil?
      redirect_to("/movies/#{params[:movie_id]}/reservation")
    end
  end
  
  def create
    array = [
      params[:reservation][:schedule_id],
      params[:reservation][:sheet_id],
      params[:reservation][:name],
      params[:reservation][:email],
      params[:reservation][:date],
      params[:reservation][:movie_id]
    ]
    if array.all?
      begin
        
              Reservation.new(
                schedule_id: params[:reservation][:schedule_id],
                sheet_id: params[:reservation][:sheet_id],
                name: params[:reservation][:name],
                email: params[:reservation][:email],
                date: params[:reservation][:date]
              ).save
      rescue ActiveRecord::RecordNotUnique
        redirect_to("/movies/#{array[5]}/reservation?schedule_id=#{array[0]}&date=#{array[4]}")
      else
        redirect_to("/movies")
      end
    else
      render :new
    end
  end
end