class AddStatusToEventReminder < ActiveRecord::Migration[5.0]
  def change
    add_column :event_reminders, :status, :string
  end
end
