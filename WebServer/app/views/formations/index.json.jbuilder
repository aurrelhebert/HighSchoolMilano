json.array!(@formations) do |formation|
  json.extract! formation, :id, :name
  json.url formation_url(formation, format: :json)
end
