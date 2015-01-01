class Audit < ActiveRecord::Base
  belongs_to :subject_user
  belongs_to :created_by
end
