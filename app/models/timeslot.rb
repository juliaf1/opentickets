class Timeslot < ApplicationRecord
  belongs_to :user

  validates :start_time, presence: true
  validates :start_time, uniqueness: { scope: :user_id }
end
