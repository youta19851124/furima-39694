class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item= Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  private
  def item_params
    params.require(:item).permit(:title, :image, :details, :price, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :shipping_duration_id, :item_price, :add_tax_price, :profit, :genre_id ).merge(user_id: current_user.id)
  end
end
