class Event < ApplicationRecord
    belongs_to :creator, class_name: :User
    
    has_many :event_attendances, foreign_key: :attendances_id
    has_many :guests, through: :event_attendances, source: :attende
    

    scope :future_events, -> { all.includes(:creator).where('date >= ? ', Date.today) }
    scope :past_events, -> { all.includes(:creator).where('date < ? ', Date.today) }
end
