class ItemsController < ApplicationController

  def index
    @items = Item.all.order(id: "DESC")
    # @items_category = Item.where("buyer_id IS NULL AND trading_status = 0 AND category_id < 200").order(created_at: "DESC")
    # @items_brand = Item.where("buyer_id IS NULL AND  trading_status = 0 AND brand_id = 1").order(created_at: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :pay_id, :area_id,:days_id, :price).merge(user_id: current_user.id)
  end
end
