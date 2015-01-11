class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.integer :message_id
      t.integer :user_id
      t.boolean :is_read
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
