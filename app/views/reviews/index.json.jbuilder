json.array!(@reviews) do |review|
  json.extract! review, :id, :faculty_expertise, :faculty_communication, :cost_worth, :transport, :library, :satisfaction_rate, :infrastructure, :sports, :research, :any_comments, :headline, :is_approved, :user_id, :school_id, :created_at
  json.url review_url(review, format: :json)
end
