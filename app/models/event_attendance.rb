class EventAttendance < ApplicationRecord
    belongs_to :attendances, class_name: :Event
    belongs_to :attende, class_name: :User
    
end
