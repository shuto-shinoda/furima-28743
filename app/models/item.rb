class Item < ApplicationRecord
  belongs_to :user
  has_one :purchases
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture_code
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :category

  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :price, format: { with: /\A[a-zA-Z0-9]+\z/, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end

  with_options numericality: { other_than: 1 , message: 'select' } do
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_code_id
    validates :preparation_day_id
    validates :category_id
  end
end
