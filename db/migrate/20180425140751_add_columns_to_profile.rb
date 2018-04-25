class AddColumnsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :Medhistory, :string
    add_column :profiles, :nextappnt, :string
    add_column :profiles, :appntreason, :string
  end
end
