class OrdersController < ApplicationController
  
    def index
      @item = Item.find(params[:item_id])
      @order = OrderAddress.new
    end
    
    def create
      @item = Item.find(params[:item_id])
      @order = OrderAddress.new(order_params)
      # Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      # customer = Payjp::Customer.create(
      # description: 'test', 
      # card: params[:token] 
      # )

      # card = OrderAddress.new( 
      #   card_token: params[:token],
      #   customer_token: customer.id,
      #   user_id: current_user.id 
      # )
      if @order.valid?
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
end

