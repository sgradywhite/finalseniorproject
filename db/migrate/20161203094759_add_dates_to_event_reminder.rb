class AddDatesToEventReminder < ActiveRecord::Migration[5.0]
  def change
    add_column :event_reminders, :start, :string
    add_column :event_reminders, :end, :string
  end
end
