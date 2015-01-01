class AddSchoolLogoToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :school_logo, :string
  end
end
