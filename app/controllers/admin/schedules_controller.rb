class Admin::SchedulesController < ApplicationController
  def index
  end
  
  def create
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    schedule = Schedule.find(params[:id])
    schedule.start_time = params[:schedule][:start_time]
    #schedule.end_time = params[:schedule][:end_time]
    schedule.save
    redirect_to("/admin/schedules")
  end

  def destroy
    Schedule.find(params[:id]).destroy
    redirect_to("/admin/schedules")
  end
end
