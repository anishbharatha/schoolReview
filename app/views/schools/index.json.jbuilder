json.array!(@schools) do |school|
  json.extract! school, :id, :name, :address, :city, :category, :state
  json.url school_url(school, format: :json)
end
