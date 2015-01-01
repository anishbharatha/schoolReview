class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_messageable
  before_update :record_changes, if: :role_changed?

  def active_for_authentication?
    super && self.role!='banned'
  end

  #To access current_user in other models/controllers
  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user]=user
  end

  private
  def record_changes
    Audit.create(subject_user_id: self.id, operation:'Role Changed from '+self.role_was+' to '+self.role, created_at:Time.now, comments:'N/A', created_by_id:User.current.id)
  end
end
