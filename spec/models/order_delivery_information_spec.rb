require 'rails_helper'

RSpec.describe OrderDeliveryInformation, type: :model do
  before do
    user = FactoryBot.create(:user, last_name: "かな")
    item = FactoryBot.create(:item, user_id: user.id)
    @order_delivery_information = FactoryBot.build(:order_delivery_information, user_id: user.id, item_id: item.id)
  end
  describe '購入情報登録' do
    context '購入情報が登録できるとき' do
      it '必要な情報が存在すれば登録できる' do
        expect(@order_delivery_information).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @order_delivery_information.building_name = ''
        expect(@order_delivery_information).to be_valid
      end
    end
    context '購入情報が登録できないとき' do
      it 'postal_codeが空だと保存できない' do
        @order_delivery_information.postal_code = ''
        @order_delivery_information.valid?
        expect(@order_delivery_information.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_delivery_information.postal_code = 1234567
        @order_delivery_information.valid?
        expect(@order_delivery_information.errors.full_messages).to include("Postal code is invalid")
      end
      it "shipping_areaで'---'が選択されている場合は登録できない" do
        @order_delivery_information.shipping_area_id = 1
        @order_delivery_information.valid?
        expect(@order_delivery_information.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it 'cityが空だと保存できない' do
        @order_delivery_information.city = ''
        @order_delivery_information.valid?
        expect(@order_delivery_information.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空だと保存できない' do
        @order_delivery_information.street_address = ''
        @order_delivery_information.valid?
        expect(@order_delivery_information.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @order_delivery_information.phone_number = ''
        @order_delivery_information.valid?
        expect(@order_delivery_information.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @order_delivery_information.user_id = nil
        @order_delivery_information.valid?
        expect(@order_delivery_information.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @order_delivery_information.item_id = nil
        @order_delivery_information.valid?
        expect(@order_delivery_information.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
