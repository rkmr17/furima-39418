class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_item,           only: [:show, :edit, :update, :destroy]
  before_action :move_to_index,      only: [:edit, :destroy]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    # @item = Item.order("created_at DESC")
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
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
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to '/'
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :delivery_cost_id,
                                 :shipping_area_id, :shipping_lead_time_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    return if current_user.id == @item.user_id || !Order.exists?(item: @item.id)

    redirect_to action: :index
  end
end
