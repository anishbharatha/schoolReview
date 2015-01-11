json.array!(@message_boxes) do |message_box|
  json.extract! message_box, :id, :sender_id, :recipient_id, :subject, :body, :conversation_id
  json.url message_box_url(message_box, format: :json)
end
