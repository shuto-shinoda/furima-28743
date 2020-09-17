class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  
    def index
      @order = OrderAddress.new
    end
    
    def create
      @order = OrderAddress.new(order_params)
      if @order.valid? && params[:token].present?
        pay_item
        @order.save
        return redirect_to root_path
      else
        render 'index'
      end
    end
  
  private
  
  def order_params
    # params.permit :token # views/index.html.erbのform_withとかストロングパラメータとattr_accessorを変更する
    params.permit(:post_code, :prefecture_id, :city, :house_number, :building_name,  :phone_number, :item_id, keys: [:order_id]).merge(token: params[:token], user_id: current_user.id)
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

