class Event < ApplicationRecord
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'

  validates :title, presence: true
  validates :event_date, presence: true

  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :attendees, through: :attendances, source: :attendee
end
