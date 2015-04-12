class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :post_type_id
      t.integer :parent_id
      t.string :title
      t.string :body
      t.references :user, index: true
      t.references :school, index: true

      t.timestamps
    end
  end
end
