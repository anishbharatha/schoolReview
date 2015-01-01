json.array!(@reviews) do |review|
  json.extract! review, :id, :faculty_expertise, :faculty_communication, :cost_worth, :transport, :library, :satisfaction_rate, :infrastructure, :sports, :research, :any_comments, :is_approved, :user_id, :school_id
  json.url review_url(review, format: :json)
end
