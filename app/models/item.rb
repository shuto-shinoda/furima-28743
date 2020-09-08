class Item < ApplicationRecord
  has_many :comments, dependent::destroy
  belongs_to :user
  has_one :purchases
  has_one_attached :image
end
