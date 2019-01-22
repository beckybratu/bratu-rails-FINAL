class AddBandNameToConcerts < ActiveRecord::Migration[5.2]
  def change
    add_column :concerts, :band_name, :string
  end
end
