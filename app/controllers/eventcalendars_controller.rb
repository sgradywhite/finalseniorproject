class EventcalendarsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]


  def index
    @events = Event.where(start: params[:start]..params[:end])
  end

  def show
      @event = Event.where(start: params[:start]..params[:end])
  end

  def new
    @event = Event.new
  end

  def edit
  end
  
  

  def create
    @event = Event.new(event_params)
    @event.save
  end


  def update
    @event.update(event_params)
    if @event.save
          UserMailer.event_confirmation(@event.id, current_user).deliver_now
          
         
    else
    end  
  end

  def destroy
    @event.destroy
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start, :end, :color)
    end
end
