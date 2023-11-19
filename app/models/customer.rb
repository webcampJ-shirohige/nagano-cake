class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy

#以下バリデーション　数字のみ漢字のみカナのみなど
  validates :telephone_number, numericality: {greater_than: 10, less_than: 11}
  validates :post_cord, numericality: {equal_to: 7}
  validates :last_name, format:{with: /\p{Han}/}
  validates :first_name, format:{with: /\p{Han}/}
  validates :last_name_kana, format:{with: /\A[ァ-ヶー]+\z/}
  validates :first_name_kana, format:{with: /\A[ァ-ヶー]+\z/}
end
