class School < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  mount_uploader :school_logo, SchoolLogoUploader

  def self.search(search)
    if search
      search_terms  = search.to_s.split(/[^0-9A-Za-z]/) #Splitting whole string
      search_terms.delete(' ') #Removing any empty strings
      Rails.logger.debug '[SEARCH TERMS 1+] '+search_terms.to_s
      where('aka LIKE ? OR aka LIKE ?',search_terms, search_terms)
    else
      all
    end
  end

end
