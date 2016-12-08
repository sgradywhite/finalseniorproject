class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]


  def index
    if current_user.role == "office"
    @events = Event.where(start: params[:start]..params[:end])
    elsif current_user.role == "patient"
      @user_id = current_user.id
        @events = (Event.where(:users_id => @user_id) | Event.where(:users_id => nil ))

    end
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

      if @event.update(event_params)

        if @event.update(status_params)





          if (EventReminder.where(:events_id => @event.id).blank?) && (EventReminder.where(:users_id => current_user.id).blank?)
              EventReminder.create(:events_id => @event.id, :users_id => current_user.id, :status => "Confirm" , :start => @event.start, :end => @event.end)

          elsif (EventReminder.where(:users_id => current_user.id).blank?) || (EventReminder.where(:events_id => @event.id).blank?)
              EventReminder.create(:events_id => @event.id, :users_id => current_user.id, :status => "Confirm" , :start => @event.start, :end => @event.end)
          elsif ((EventReminder.where(:users_id => current_user.id).present?) || (EventReminder.where(:events_id => @event.id).blank?))
              EventReminder.create(:events_id => @event.id, :users_id => current_user.id, :status => "Confirm" , :start => @event.start, :end => @event.end)
          elsif ((EventReminder.where(:users_id => current_user.id).blank?) || (EventReminder.where(:events_id => @event.id).present?))
              EventReminder.create(:events_id => @event.id, :users_id => current_user.id, :status => "Confirm" , :start => @event.start, :end => @event.end)
          elsif
              redirect_to (patient_page_path)
          end






        else
        end

      else
      end

  end
  def gotoeventcalendar
  end

  def destroy
    @event.destroy
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start, :end, :color, :status)
    end
    def status_params
      params.require(:event).permit(:status)
    end
end
