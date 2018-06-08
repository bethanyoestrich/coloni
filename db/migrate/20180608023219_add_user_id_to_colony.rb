class AddUserIdToColony < ActiveRecord::Migration[5.1]
  def change
    add_column :colonies, :user_id, :integer
  end
end
