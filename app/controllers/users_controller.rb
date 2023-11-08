class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @events = Event.where(user_id: current_user.id)
    @attended_events = Event.joins(:attendances).where(attendances: { attendee_id: current_user.id}).order(event_date: :desc)
    puts "!!!!!!!!!!!!!"
    puts @attended_events
    puts "!!!!!!!!!!!!!"
  end
end
