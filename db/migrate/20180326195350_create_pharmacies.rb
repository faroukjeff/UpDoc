class CreatePharmacies < ActiveRecord::Migration
  def change
    create_table :pharmacies do |t|
      t.string :name
      t.string :pnumber
      t.string :city
      t.integer :hnumber
      t.string :street
    end
  end
end
