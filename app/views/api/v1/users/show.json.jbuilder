
json.extract! @user, :id, :nickname, :open_id, :gender, :city, :province, :country, :avatarUrl, :replies
json.messages @user.messages do |message|
  json.extract! message, :id, :content, :read_status, :replies
    json.replies message.replies do |reply|
      json.extract! reply, :id, :content, :read_status, :user, :message_id
      json.reply_time reply.created_at.strftime("%Y-%m-%d %H:%M")
    end
  json.msg_time message.created_at.strftime("%Y-%m-%d %H:%M")
end
json.fav_sports @fav_sports
json.sports @user.sports do |sport|
  json.extract! sport, :id, :title, :description, :category, :price, :photo, :province, :city, :district, :address, :latitude, :longitude, :capacity, :level, :like
  json.start_time sport.start_time
  json.end_time sport.end_time
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
