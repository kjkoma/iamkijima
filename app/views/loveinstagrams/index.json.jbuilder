json.array!(@loveinstagrams) do |loveinstagram|
  json.extract! loveinstagram, :id, :loveword
  json.url loveinstagram_url(loveinstagram, format: :json)
end
