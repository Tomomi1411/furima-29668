class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 with_options presence: true do
  validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
  #validates :email, presence: true, uniqueness: {case_sensitive: false}, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
  validates :password, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
  validates :password_confirmation, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
  validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
  validates :surname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
  validates :name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
  validates :surname_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
  validates :birth
 end
end
