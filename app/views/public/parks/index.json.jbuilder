json.data do
  json.items do
    json.array!(@parks) do |park|
      json.id park.id
      json.name park.park_name
      json.address park.address
      json.latitude park.latitude
      json.longitude park.longitude
    end  
  end
end