class Sport < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates :title, presence: true
  # include PgSearch
  # # pg_search_scope :search_by_title_and_category,
  # #   against: [ :title, :category ],
  # #   using: {
  # #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  # #   }
  # multisearchable against: [ :title, :category, :start_time, :address ]

  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
  # acts_as_taggable_on :tags
end
