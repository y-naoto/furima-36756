class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :firstname_kannji, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :lastname_kannji, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :firstname_katakana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :lastname_katakana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  has_many :items
  has_many :buy_items
end
