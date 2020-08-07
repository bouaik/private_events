# frozen_string_literal: true

class AddForeignKeysToEventAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :event_attendances, :attende_id, :integer
    add_column :event_attendances, :attendances_id, :integer
  end
end
