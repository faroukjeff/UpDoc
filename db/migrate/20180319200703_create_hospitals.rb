class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :pnumber
      t.string :city
      t.string :street
      t.integer :hnumber

      t.timestamps null: false
    end
  end
end
