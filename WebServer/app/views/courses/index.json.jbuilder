json.array!(@courses) do |course|
  json.extract! course, :id, :title, :desc, :startingHour, :finishHour
  json.url course_url(course, format: :json)
end