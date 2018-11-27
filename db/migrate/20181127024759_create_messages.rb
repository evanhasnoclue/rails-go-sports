class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.references :sport, foreign_key: true
      t.text :content
      t.boolean :read_status, default:false
      t.time :msg_time

      t.timestamps
    end
  end
end
