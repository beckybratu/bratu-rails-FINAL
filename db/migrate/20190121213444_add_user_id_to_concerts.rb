class AddUserIdToConcerts < ActiveRecord::Migration[5.2]
  def change
    add_column :concerts, :user_id, :integer
  end
end
