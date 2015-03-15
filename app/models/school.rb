class School < ActiveRecord::Base
  has_many :reviews
  belongs_to :user

  searchkick

  mount_uploader :school_logo, SchoolLogoUploader
end
