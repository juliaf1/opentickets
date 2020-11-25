class Review < ApplicationRecord
  belongs_to :ticket

  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true, less_than: 6 }
  validates :content, length: { in: 12..500 }
  validates :ticket_id, uniqueness: true
end
