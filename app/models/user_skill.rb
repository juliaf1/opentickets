class UserSkill < ApplicationRecord
  belongs_to :user
  has_one :skill
end
