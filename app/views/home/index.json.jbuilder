json.array!(@animals) do |animal|
  json.extract! animal, :id, :name, :age, :description, :family, :contact
  json.url animal_url(animal, format: :json)
end
