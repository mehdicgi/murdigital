json.array!(@providers) do |provider|
  json.extract! provider, :id, :name, :img_src, :color, :picto
  json.url provider_url(provider, format: :json)
end
