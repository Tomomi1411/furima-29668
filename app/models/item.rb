class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :purchase_history

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :category
  belongs_to_active_hash :pay
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  with_options presence: true do
    validates :name
    validates :explanation
  end

  with_options numericality: { other_than: 1 }  do
   validates :category_id 
   validates :condition_id
   validates :pay_id
   validates :area_id
   validates :day_id
  end
  
  validates :price, numericality: {with: /\A[0-9]+\z/}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } 
end
