class AddRealToSports < ActiveRecord::Migration[5.2]
  def change
    add_column :sports, :real, :boolean
  end
end
