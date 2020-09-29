class Item < ApplicationRecord
  has_one_attached :image

  REGIX = /\A[ぁ-んァ-ン一-龥]/
  validates :name, presence: true, format: { with: REGIX, message: "is invalid. Input full-width characters."}
  validates :explanation, presence: true, format: { with: REGIX, message: "is invalid. Input full-width characters."}
  validates :category, numericality: { other_than: 1 } 
  validates :condition, numericality: { other_than: 1 } 
  validates :pay_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 1 } 
  validates :days_id, numericality: { other_than: 1 } 
  validates :price, numericality: { other_than: 1 } 
end
