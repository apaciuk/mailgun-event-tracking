class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t| 
      t.string :message_id , null: false
      t.integer :track_status, null: false
      t.string :message, null: true
      t.string :severity, null: true
      t.string :reason, null: true
      t.string :recipient, null: false
      t.string :subject, null: true
      t.string :sender, null: true
      t.json :headers, null: false

      t.timestamps
    end
  end
end
