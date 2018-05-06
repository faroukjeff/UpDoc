class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :pid
      t.string :did
      t.string :slot
      t.string :av

      t.timestamps null: false
    end
  end
end
