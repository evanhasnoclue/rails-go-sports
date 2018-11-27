class User < ApplicationRecord
  has_many :sports, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :replies, dependent: :destroy
  validates :nickname, presence: true
  validates :open_id, uniqueness: true
end
