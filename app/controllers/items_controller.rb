class ItemsController < ApplicationController
	before_action :authenticate_user!, except: :index
	def index
	end

  def new 
    @item = Item.new
  end

  def create 
	  @item = Item.new(item_params) 
		if @item.save
      redirect_to items_path(@items)
    else
      render :new
	  end
  end

	private

  def item_params
    params.require(:item).permit(:item_name, :price, :product_description, 
      :category_id, :item_condition_id, :shipping_charge_id, :shipping_area_id, 
      :estimated_time_id, :image).merge(user_id: current_user.id)
  end
end
