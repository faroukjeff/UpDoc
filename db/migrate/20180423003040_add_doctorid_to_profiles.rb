class AddDoctoridToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :docid, :string
  end
end
