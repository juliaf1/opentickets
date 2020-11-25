class Timeslot < ApplicationRecord
  belongs_to :user
  has_one :ticket, dependent: :destroy

  validates :start_time, presence: true
  validates :start_time, uniqueness: { scope: :user_id }
end
