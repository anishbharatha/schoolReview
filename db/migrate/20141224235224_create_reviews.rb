class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.decimal :faculty_expertise
      t.decimal :faculty_communication
      t.decimal :cost_worth
      t.decimal :transport
      t.decimal :library
      t.decimal :satisfaction_rate
      t.decimal :infrastructure
      t.decimal :sports
      t.decimal :research
      t.string :any_comments
      t.boolean :is_approved
      t.references :user, index: true
      t.references :school, index: true

      t.timestamps
    end
  end
end
