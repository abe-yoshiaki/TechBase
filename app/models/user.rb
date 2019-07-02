class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :nickname, presence: true
  validates :email, presence: true,uniqueness: true
  validates :password, presence: true, length: { in: 6..128 } 
  validates :password_confirmation, presence: true
end
