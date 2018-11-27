class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :sport
  validates :user_id, :uniqueness => { :scope => :sport_id }
end
