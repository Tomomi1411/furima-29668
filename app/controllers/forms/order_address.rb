class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address , :building_name, :phone_number, :purchase_history, :price, :token