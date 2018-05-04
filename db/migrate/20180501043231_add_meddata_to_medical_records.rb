class AddMeddataToMedicalRecords < ActiveRecord::Migration
  def change
    add_column :medical_records, :meddata, :string
  end
end
