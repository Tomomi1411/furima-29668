class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchase_histories

 REGIX = /\A[a-z0-9]+\z/i
 NAMEREGIX = /\A[ぁ-んァ-ン一-龥]/
 KANAREGIX = /\A[ァ-ヶーR－]+\z/
 with_options presence: true do
  validates :nickname, format: { with: REGIX, message: "is invalid. Input half-width characters."}
  validates :password, format: { with: REGIX, message: "is invalid. Input half-width characters."}
  validates :password_confirmation, format: { with: REGIX, message: "is invalid. Input half-width characters."}
  validates :name, format: { with: NAMEREGIX, message: "is invalid. Input full-width characters."}
  validates :surname, format: { with: NAMEREGIX, message: "is invalid. Input full-width characters."}
  validates :name_kana, format: { with: KANAREGIX, message: "is invalid. Input full-width katakana characters."}
  validates :surname_kana, format: { with: KANAREGIX, message: "is invalid. Input full-width katakana characters."}
  validates :birth
 end
end
