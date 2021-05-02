class AddUserIdToTapes < ActiveRecord::Migration[6.1]
  def change
    add_column :tapes, :user_id, :integer
  end
end
