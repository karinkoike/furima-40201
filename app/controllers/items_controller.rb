class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :category_id, :item_state_id, :delivery_charge_burden_id, :prefecture_id, :delivery_date_id, :price)
  end
end
