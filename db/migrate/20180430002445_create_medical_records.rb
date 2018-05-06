class CreateMedicalRecords < ActiveRecord::Migration
  def change
    create_table :medical_records do |t|
      t.string :pnumber
      t.string :name
      t.string :address
      t.string :healthcare
      t.string :medhistory

      t.timestamps null: false
    end
  end
end
