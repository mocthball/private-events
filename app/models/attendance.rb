class Attendance < ApplicationRecord
  validates :attendee_id, presence: true
  validates :attended_event_id, presence: true

  # Custom method to handle RSVP status, for example
  def accept_invitation
    update(rsvp_status: 'accepted')
  end
end
