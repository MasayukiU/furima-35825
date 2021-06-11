class ItemsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :move_to_index, only: [:edit]

	def index
    @items = Item.all.order("created_at DESC")
	end

  def new 
    @item = Item.new
  end

  def create 
	  @item = Item.new(item_params) 
		if @item.save
      redirect_to items_path
    else
      render :new
	  end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
		@item = Item.find(params[:id])
	end

  def update
		@item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

	private

  def item_params
    params.require(:item).permit(:item_name, :price, :product_description, 
      :category_id, :item_condition_id, :shipping_charge_id, :shipping_area_id, 
      :estimated_time_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id
     		redirect_to action: :index
     end
  end
end
