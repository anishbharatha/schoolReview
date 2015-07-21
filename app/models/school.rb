class School < ActiveRecord::Base
  has_many :reviews
  belongs_to :user

  searchkick autocomplete: ['name']

  mount_uploader :school_logo, SchoolLogoUploader

  before_update :titleize_school_name
  before_create :titleize_school_name

  def titleize_school_name
    self.name = self.name.titleize
  end

  def self.find_by_name(name)
    puts 'Custom find_by_name working on '+name
    where("LOWER(name) ILIKE ?", "%#{name}%").take
  end
end
