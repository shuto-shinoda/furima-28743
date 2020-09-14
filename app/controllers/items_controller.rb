class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_item, only: [:edit, :show]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if (@item.valid?) && (@item.save)
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to items_path
    else
      render :edit
    end  
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :condition_id, :postage_payer_id, :prefecture_code_id, :preparation_day_id, :category_id).merge(user_id:current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
