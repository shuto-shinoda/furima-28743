require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      @order = FactoryBot.build(:order_address)
    end

      context '新規登録がうまくいくとき' do
        it "orderの内容が全てが存在すれば登録できる" do
          expect(@order).to be_valid
        end
      end

  it "post_codeが必須であること" do
    @order.post_code = ""
    @order.valid?
    expect(@order.errors.full_messages).to include("Post code can't be blank")
  end

  it "post_codeにハイフンが必須である" do
    @order.post_code = "1234567"
    @order.valid?
    expect(@order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
  end

   it"prefectureが必須であること" do
    @order.prefecture_id = ""
    @order.valid?
    expect(@order.errors.full_messages).to include("Prefecture can't be blank")
  end

  it"prefectureが--以外であること" do
    @order.prefecture_id = 1
    @order.valid?
    expect(@order.errors.full_messages).to include("Prefecture select")
  end


  it "cityが必須であること" do
    @order.city = ""
    @order.valid?
    expect(@order.errors.full_messages).to include("City can't be blank")
  end

  it "house_numberが必須であること" do
    @order.house_number = ""
    @order.valid?
    expect(@order.errors.full_messages).to include("House number can't be blank")
  end

  it "phone_numberが必須であること" do
    @order.phone_number = ""
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone number can't be blank")
  end

  it "phone_numberが11桁以内であること" do
    @order.phone_number = "111111111111"
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone number is invalid")
  end
end
end
