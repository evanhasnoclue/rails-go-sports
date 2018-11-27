json.sports do
  json.array! @sports do |sport|
    json.extract! sport, :id, :title, :description, :category, :start_time, :end_time, :price, :photo, :province, :city, :district, :address, :capacity, :level, :user
     # :latitude, :longitude, tag_list: []

  end
end
