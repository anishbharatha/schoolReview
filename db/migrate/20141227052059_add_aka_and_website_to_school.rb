class AddAkaAndWebsiteToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :aka, :string
    add_column :schools, :website, :string
  end
end
