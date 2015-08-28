json.array!(@adopters) do |adopter|
  json.extract! adopter, :id, :name, :rg, :cpf, :address, :phone
  json.url adopter_url(adopter, format: :json)
end
