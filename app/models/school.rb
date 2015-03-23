class School < ActiveRecord::Base
  has_many :reviews
  belongs_to :user

  searchkick

  mount_uploader :school_logo, SchoolLogoUploader

  before_update :titleize_school_name
  before_create :titleize_school_name

  def titleize_school_name
    self.name = self.name.titleize
  end
end
