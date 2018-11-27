class Message < ApplicationRecord
  belongs_to :user
  belongs_to :sport
  has_many :replies, dependent: :destroy
  validates :user_id, :uniqueness => { :scope => :sport_id }
end
