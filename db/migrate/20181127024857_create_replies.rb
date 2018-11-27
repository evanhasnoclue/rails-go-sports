class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.text :content
      t.boolean :read_status, default:false
      t.time :msg_time
      t.references :user, foreign_key: true
      t.references :message, foreign_key: true

      t.timestamps
    end
  end
end
