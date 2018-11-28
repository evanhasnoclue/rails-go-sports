json.sports do
  json.array! @sports do |sport|
    json.extract! sport, :id, :title, :description, :category, :start_time, :end_time, :price, :photo, :province, :city, :district, :address, :latitude, :longitude, :capacity, :level, :like, :user
     # :latitude, :longitude, tag_list: []

  end
end
