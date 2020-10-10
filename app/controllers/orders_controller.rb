class OrdersController < ApplicationController

  before_action :set_item 

  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'index'
    end
  end

  private
  
 def order_params
   params.permit(:postal_code, :prefecture_id, :address, :municipality, :building_name, :phone_number, :price, :token, :item_id).merge(user_id: current_user.id)
 end

 def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
   Payjp::Charge.create(
     amount: @item.price,
     card: order_params[:token],
     currency:'jpy'
   )
 end

 def set_item 
  @item = Item.find(params[:item_id])
 end
end
