class AddCoordinatesToSports < ActiveRecord::Migration[5.2]
  def change
    add_column :sports, :latitude, :float
    add_column :sports, :longitude, :float
  end
end
