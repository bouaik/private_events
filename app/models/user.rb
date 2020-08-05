class User < ApplicationRecord
    has_many :events, foreign_key: :creator_id, class_name: :Event
    has_many :attended_event, through: :event_attendances
    has_many :event_attendances, foreign_key: :attende_id, class_name: :EventAttendance
end
