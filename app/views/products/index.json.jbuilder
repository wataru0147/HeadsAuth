json.array!(@products) do |product|
  json.extract! product, :id, :names, :price, :description, :brand_id, :published
  json.url product_url(product, format: :json)
end
