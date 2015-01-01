class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :school

  before_update :record_approval, if: :is_approved_changed?

  private
  def record_approval
    @audit = Audit.create(subject_user_id: self.user.id, operation:'Review Approved',created_at:Time.now, comments:'N/A', created_by_id:User.current.id)
  end

end
