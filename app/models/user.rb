class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :name
    #PASSWORD_REGEX = /\A(?=.6?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :second_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :second_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birth_date
  end
end

