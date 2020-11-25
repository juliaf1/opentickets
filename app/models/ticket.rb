class Ticket < ApplicationRecord
  belongs_to :timeslot
  belongs_to :user

  validates :timeslot_id, uniqueness: true
end
