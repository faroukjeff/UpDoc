class AddUsertypeToCredentials < ActiveRecord::Migration
  def change
    add_column :credentials, :usertype, :string
  end
end
