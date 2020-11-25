class Ticket < ApplicationRecord
  belongs_to :timeslot
  belongs_to :user
  has_one :review, dependent: :destroy

  validates :timeslot_id, uniqueness: true
end
