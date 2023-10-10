class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create], except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_description, :category_id, :product_condition_id, :shipping_fee_id,
                                 :prefecture_id, :shipping_time_id, :priced, :image)
  end
end
