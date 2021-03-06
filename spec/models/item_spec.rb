require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item =FactoryBot.build(:item)
  end

  it "画像は1枚必須である" do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")  

  end

  it "商品名が必須である" do
    @item.name = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")  
  end

  it "商品の説明が必須である" do
    @item.introduction = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Introduction can't be blank")
  end

  it "カテゴリーの情報が必須である" do
    @item.category_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Category select")
  end

  it "商品の状態についての情報が必須である" do
    @item.condition_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition select")
  end

  it "配送料の負担についての情報が必須である" do
    @item.postage_payer_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Postage payer select")
  end

  it "発送元の地域についての情報が必須である" do
    @item.prefecture_code_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture code select")
  end

  it "発送までの日数についての情報が必須である" do
    @item.preparation_day_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Preparation day select")
  end

  it "価格についての情報が必須である" do
    @item.price = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")  
  end

  it "価格の範囲が、¥300~¥9,999,999の間である" do
    @item.price{"1111"}
    @item.valid?
    expect(@item).to be_valid
  end

  it "販売価格は半角数字のみ入力可能である" do
    @item.price = "1111"
    @item.valid?
    expect(@item).to be_valid
  end

  it "カテゴリーが--を示すid値だと出品登録できない" do
    @item.category_id = "--"
    @item.valid?
    expect(@item.errors.full_messages).to include("Category select")  
  end

  it "商品状態が--を示すid値だと出品登録できない" do
    @item.condition_id = "--"
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition select")  
  end

  it "配送料負担が--を示すid値だと出品登録できない" do
    @item.postage_payer_id = "--"
    @item.valid?
    expect(@item.errors.full_messages).to include("Postage payer select")  
  end

  it "発送元地域が--を示すid値だと出品登録できない" do
    @item.prefecture_code_id = "--"
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture code select")  
  end

  it "発足までの日数が--を示すid値だと出品登録できない" do
    @item.preparation_day_id = "--"
    @item.valid?
    expect(@item.errors.full_messages).to include("Preparation day select")  
  end

  it "価格が299以下だと出品登録できない" do
    @item.price = "299"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price Enter the amount within 300 ~ 1000000.")  
  end

  it "価格が10,000,000以上だと出品登録できない" do
    @item.price = "10000000"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price Enter the amount within 300 ~ 1000000.")  
  end

  it "価格が全角数字だと出品登録できない" do
    @item.price = "１１１１"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters.")  
  end

end
