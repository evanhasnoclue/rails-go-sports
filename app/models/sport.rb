class Sport < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates :title, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
  # acts_as_taggable_on :tags
end
