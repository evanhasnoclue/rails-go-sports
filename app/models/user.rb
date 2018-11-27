class User < ApplicationRecord
  has_many :sports
  has_many :bookings, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :replies, dependent: :destroy
  validates :name, presence: true
  validates :wechat_id, uniqueness: true
end
