class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.order(event_date: :asc)
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    @event.user_id = current_user.id

    if @event.save
      redirect_to events_path
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendances = User.joins(:attendances).where(attendances: { attended_event_id: params[:id]}).pluck(:username)
  end

  def attend
    @attendance = Attendance.new(attendee_id: current_user.id, attended_event_id: params[:id])
    if @attendance.save
      flash[:success] = "You've successfully joined the event!"
    else
      flash[:error] = "There was an error joining the event."
    end
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :event_date)
  end

  def set_event
    @event = Event.find(current_user.id)
  end

end
