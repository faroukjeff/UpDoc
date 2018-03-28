class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :first_name
      t.string :last_name_string
      t.text :address
      t.string :pnumber
      t.string :Healthcare
      t.string :password
    end
  end
end
