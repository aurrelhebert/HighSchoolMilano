json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :firstName, :name, :desk, :phone, :email
  json.url teacher_url(teacher, format: :json)
end
