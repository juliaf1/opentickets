class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_skills
  has_many :timeslots
  has_many :skills, through: :user_skills
  has_many :tickets, through: :timeslots
  has_many :reviews, through: :tickets

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :bio, length: { maximum: 500 }
end
