class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :user_skills, dependent: :destroy
  has_many :timeslots, dependent: :destroy
  has_many :skills, through: :user_skills
  has_many :tickets, through: :timeslots
  has_many :booked_tickets, class_name: 'Ticket', foreign_key: 'user_id', dependent: :destroy
  has_many :reviews, through: :tickets
  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :bio, length: { maximum: 500 }
end
