json.array!(@recipients) do |recipient|
  json.extract! recipient, :id, :message_id, :user_id, :is_read, :is_deleted
  json.url recipient_url(recipient, format: :json)
end
