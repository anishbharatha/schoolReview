class AddEstdToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :estd, :date
  end
end
