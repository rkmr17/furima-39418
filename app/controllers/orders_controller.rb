class OrdersController < ApplicationController
  before_action :set_item,           only: [:index, :create]
  before_action :move_to_index,      only: [:index]
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_delivery_information = OrderDeliveryInformation.new
  end

  def create
    @order_delivery_information = OrderDeliveryInformation.new(order_params)
    if @order_delivery_information.valid?
      pay_item
      @order_delivery_information.save
      redirect_to '/'
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_delivery_information).permit(:postal_code, :shipping_area_id, :city, :street_address, :building_name, :phone_number, :item_id, :user_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card:   order_params[:token],
        currency: 'jpy'
      )
  end

  def move_to_index
   if Order.exists?(item: @item.id) || !user_signed_in?
    redirect_to '/'
   end
  end
end