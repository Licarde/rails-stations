class Admin::ReservationsController < ApplicationController
  def index
    @movies = Movie.where(is_showing: true)
    @schedules = Schedule.all
    @reservations = Reservation.all
  end

  def new
    @schedules = Schedule.all
    @sheets = Sheet.all
  end

  def show
    @schedules = Schedule.all
    @sheets = Sheet.all
    @reservation = Reservation.find(params[:id])
  end

  def create
    array = [
      params[:reservation][:schedule_id],
      params[:reservation][:sheet_id],
      params[:reservation][:name],
      params[:reservation][:email],
      params[:reservation][:date]
    ]
    if array.all?
      begin
        Reservation.new(
          schedule_id: array[0],
          sheet_id: array[1],
          name: array[2],
          email: array[3],
          date: array[4]
        ).save!
        #raise ActiveRecord::RecordInvalid
      rescue ActiveRecord::RecordInvalid => invalid
        flash[:notice] = '重複データです'
        redirect_to status: 400
      else
        flash[:notice] = '予約完了'
        redirect_to "/admin/reservations"
      end
    else
      flash[:notice] = '不正データ'
      redirect_to "/admin/reservations"
    end
  end

  def update
    array = [
      params[:reservation][:schedule_id],
      params[:reservation][:sheet_id],
      params[:reservation][:name],
      params[:reservation][:email],
      params[:reservation][:date]
    ]
    @reservation = Reservation.find(params[:id])
    if array.all?
      begin
        @reservation.update(
          schedule_id: array[0],
          sheet_id: array[1],
          name: array[2],
          email: array[3],
          date: array[4]
        )
      rescue ActiveRecord::RecordNotUnique
        flash[:notice] = '重複データです'
        redirect_to 
      else
        flash[:notice] = '予約完了'
        redirect_to "/admin/reservations"
      end
    else
      flash[:notice] = '不正データ'
      redirect_to 
    end
  end
  
  def destroy
    Reservation.find(params[:id]).destroy
    redirect_to "/admin/reservations"
  end
end
