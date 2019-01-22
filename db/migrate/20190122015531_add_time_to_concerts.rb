class AddTimeToConcerts < ActiveRecord::Migration[5.2]
  def change
    add_column :concerts, :concert_time, :string
    add_column :concerts, :time, :string
  end
end
