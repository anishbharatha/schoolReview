class AddHeadlineToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :headline, :string
  end
end
