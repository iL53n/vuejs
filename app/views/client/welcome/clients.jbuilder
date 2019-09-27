json.array! @clients do |item|
  json.id item[:id]
  json.id item[:email]
end