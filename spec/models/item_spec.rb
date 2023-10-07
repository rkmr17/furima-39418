require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報登録' do
    context '商品登録できるとき' do
      it '必要な情報が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品登録できないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空だと登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'descriptionが空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'categoryが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "categoryで'---'が選択されている場合は登録できない" do
        @item.category_id = Category.find(1)
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'conditionが空だと登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "conditionで'---'が選択されている場合は登録できない" do
        @item.condition_id = Condition.find(1)
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'delivery_costが空だと登録できない' do
        @item.delivery_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery cost can't be blank")
      end
      it "delivery_costで'---'が選択されている場合は登録できない" do
        @item.delivery_cost_id = DeliveryCost.find(1)
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery cost can't be blank")
      end
      it 'shipping_areaが空だと登録できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it "shipping_areaで'---'が選択されている場合は登録できない" do
        @item.shipping_area_id = ShippingArea.find(1)
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'shipping_lead_timeが空だと登録できない' do
        @item.shipping_lead_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping lead time can't be blank")
      end
      it "shipping_lead_timeで'---'が選択されている場合は登録できない" do
        @item.shipping_lead_time_id = ShippingLeadTime.find(1)
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping lead time can't be blank")
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceの値が300未満だと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end
      it 'priceの値が9999999より大きいと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it 'pricsは全角(漢字・ひらがな・カタカナ)での登録はできない' do
        @item.price = 'あ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceは全角数値での登録はできない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
