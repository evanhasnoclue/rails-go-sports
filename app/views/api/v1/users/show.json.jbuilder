
json.extract! @user, :id, :nickname, :open_id, :gender, :city, :province, :country, :avatarUrl
json.fav_sports @fav
json.sports @user.sports do |sport|
  json.extract! sport, :id, :title, :description, :category, :price, :photo, :province, :city, :district, :address, :latitude, :longitude, :capacity, :level
  json.start_time sport.start_time.strftime("%Y-%m-%d %H:%M")
  json.end_time sport.end_time.strftime("%Y-%m-%d %H:%M")
  json.messages sport.messages
  # do |message|
  #   json.extract! replies, message.replies
  # end
  json.date sport.created_at.strftime("%m/%d/%y")
end
json.bookings @user.bookings do |booking|
  json.extract! booking, :id, :sport
  json.create_date booking.created_at.strftime("%m/%d/%y")
end
# json.messages @user.messages do |message|
#   json.extract! message.sport
#   json.create_date booking.sport.created_at.strftime("%m/%d/%y")
# end
