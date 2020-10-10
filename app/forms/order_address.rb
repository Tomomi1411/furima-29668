class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address , :building_name, :phone_number, :purchase_history, :token, :item_id, :user_id

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :municipality
    validates :address
    # validates :building_name
    validates :phone_number
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, phone_number: phone_number, order: order)
  end
end