class CreateSports < ActiveRecord::Migration[5.2]
  def change
    create_table :sports do |t|
      t.string :category
      t.string :title
      t.string :description
      t.time :start_time
      t.time :end_time
      t.float :price
      t.string :photo
      t.string :province
      t.string :city
      t.string :district
      t.string :address
      t.integer :capacity
      t.string :level
      t.integer :like, default:0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
