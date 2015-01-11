class CreateMessageBoxes < ActiveRecord::Migration
  def change
    create_table :message_boxes do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.string :subject
      t.text :body
      t.integer :conversation_id

      t.timestamps
    end
  end
end
