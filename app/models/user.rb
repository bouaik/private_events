class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }

  has_many :events, foreign_key: :creator_id, class_name: :Event
  has_many :event_attendances, foreign_key: :attende_id
  has_many :attended_events, through: :event_attendances, source: :attendances

  def to_s
    email
  end

  def upcoming_events
    events.where('date >= ?', Date.today)
  end

  def previous_events
    events.where('date < ?', Date.today)
  end
end
