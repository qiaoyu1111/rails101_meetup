class AddUserIdToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :meetups, :user_id, :integer
  end
end
