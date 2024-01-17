class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!
  before_action :redirect_if_direct_access

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_form_params
    item = Item.find(params[:item_id])
    params.require(:order_form).permit(:post, :prefecture_id, :city, :block, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: item.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_form_params[:price],
      card: order_form_params[:token], 
      currency: 'jpy' 
    )
  end

  def redirect_if_direct_access
    redirect_to root_path unless request.referer
  end
end
