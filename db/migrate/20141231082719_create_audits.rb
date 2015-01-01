class CreateAudits < ActiveRecord::Migration
  def change
    create_table :audits do |t|
      t.references :subject_user, index: true
      t.string :operation
      t.date :created_at
      t.references :created_by, index: true
      t.string :comments

      t.timestamps
    end
  end
end
