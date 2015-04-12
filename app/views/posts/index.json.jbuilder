json.array!(@posts) do |post|
  json.extract! post, :id, :post_type_id, :parent_id, :title, :body, :user_id, :school_id
  json.url post_url(post, format: :json)
end
