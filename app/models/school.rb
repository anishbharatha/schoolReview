class School < ActiveRecord::Base
  has_many :reviews
  mount_uploader :school_logo, SchoolLogoUploader

  def self.search(search)
    if search
      where('name LIKE ? OR aka LIKE ?','%'+search+'%','%'+search+'%')
    else
      all
    end
  end

end
