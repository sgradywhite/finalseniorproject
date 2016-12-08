class CreateEventReminders < ActiveRecord::Migration[5.0]
  def change
    create_table :event_reminders do |t|
      t.belongs_to :events, index: true
      t.belongs_to :users, index: true
      t.string :twodaysreminder
      t.string :samedayreminder

      t.timestamps
    end
  end
end
