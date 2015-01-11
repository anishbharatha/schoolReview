class Recipient < ActiveRecord::Base
  belongs_to :message_box
  belongs_to :user

end
