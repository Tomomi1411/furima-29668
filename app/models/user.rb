class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
  #validates :email, presence: true, uniqueness: {case_sensitive: false}, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
  validates :password, presence: true, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
  validates :password_confirmation, presence: true, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
  validates :surname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
  validates :name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
  validates :surname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
  validates :birth, presence: true
end
