# frozen_string_literal: true

class CreateEventAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :event_attendances, &:timestamps
  end
end
