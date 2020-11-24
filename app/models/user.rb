class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_skills
  has_many :skills, through: :user_skills

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :bio, length: { maximum: 500 }
end
