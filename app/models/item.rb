class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :purchase_history

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  with_options presence: true do
    validates :name
    validates :explanation
  end

  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :pay_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 1 } 
  validates :days_id, numericality: { other_than: 1 } 
  validates :price, numericality: {with: /\A[0-9]+\z/}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } 
end
