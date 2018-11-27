class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :open_id
      t.string :gender
      t.string :city
      t.string :province
      t.string :country
      t.string :avatarUrl
      t.text :info

      t.timestamps
    end
  end
end
