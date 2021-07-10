class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = ItemsTag.new
  end

  def create
    @item = ItemsTag.new(itemtag_params)
    # binding.pry
    if @item.valid?
       @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['tags_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  private
  
  def itemtag_params
    params.require(:items_tag).permit(:tags_name, :item_name, :price, :product_description,
                                 :category_id, :item_condition_id, :shipping_charge_id, :shipping_area_id,
                                 :estimated_time_id, images: []).merge(user_id: current_user.id)
  end
  
  def item_params
    params.require(:item).permit(:item_name, :price, :product_description,
                                 :category_id, :item_condition_id, :shipping_charge_id, :shipping_area_id,
                                 :estimated_time_id, images: []).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index if current_user.id != @item.user_id || @item.order.present?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
