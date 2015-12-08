json.array!(@loveyotubes) do |loveyotube|
  json.extract! loveyotube, :id, :loveword
  json.url loveyotube_url(loveyotube, format: :json)
end
