class AddFbIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :fb_identity, :string, :limit => 20
    add_column :users, :token, :string
  end
end
