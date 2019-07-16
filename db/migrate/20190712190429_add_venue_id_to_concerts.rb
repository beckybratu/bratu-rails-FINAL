class AddVenueIdToConcerts < ActiveRecord::Migration[5.2]
  def change
    add_column :concerts, :venue_id, :integer
  end
end
