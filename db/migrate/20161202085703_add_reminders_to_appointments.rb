class AddRemindersToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :twodaysreminder, :string
    add_column :appointments, :samedayreminder, :string
  end
end
