class OrdersController < ApplicationController
  before_action :set_item,           only: [:index, :create]

  def index
    @order_delivery_information = OrderDeliveryInformation.new
  end

  def create
    @order_delivery_information = OrderDeliveryInformation.new(order_params)
    if @order_delivery_information.valid?
      @order_delivery_information.save
      redirect_to '/'
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_delivery_information).permit(:postal_code, :shipping_area_id, :city, :street_address, :building_name, :phone_number, :item_id, :user_id).merge(user_id: current_user.id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end