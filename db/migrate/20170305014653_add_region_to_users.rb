class AddRegionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :region, :string
    add_column :users, :profile, :text
  end
end
