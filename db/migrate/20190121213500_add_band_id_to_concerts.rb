class AddBandIdToConcerts < ActiveRecord::Migration[5.2]
  def change
    add_column :concerts, :band_id, :integer
  end
end
