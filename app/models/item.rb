class Item < ApplicationRecord
  has_many :comments, dependent::destroy
  belongs_to :user
  has_one :purchases
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :price
    validates :item_condition
    validates :postage_payer
    validates :prefecture_code
    validates :preparation_day
    validates :category
  end
end
