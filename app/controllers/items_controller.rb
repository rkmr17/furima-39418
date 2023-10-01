class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
    #@item = Item.order("created_at DESC")
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :delivery_cost_id, :shipping_area_id, :shipping_lead_time_id, :price).merge(user_id: current_user.id)
  end
end

