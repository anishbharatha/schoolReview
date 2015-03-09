class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :model
      t.integer :model_id
      t.string :type
      t.string :content

      t.timestamps
    end
  end
end
