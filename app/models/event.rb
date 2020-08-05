class Event < ApplicationRecord
    belongs_to :creator, class_name: :User
    has_many :attandances, through: :event_attendances, source: :attende
    has_many :event_attendances, foreign_key: :attendances_id, class_name: :EventAttendance

end
