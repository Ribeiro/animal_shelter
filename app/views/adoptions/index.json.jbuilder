json.array!(@adoptions) do |adoption|
  json.extract! adoption, :id, :adopter_id, :animal_id
  json.url adoption_url(adoption, format: :json)
end
