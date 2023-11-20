class Item < ApplicationRecord

  has_one_attached :image

  has_many :car_items
  has_many :order_details
  has_many :orders, through: :order_details #n:mの関係を表現するアソシエーション。
  belongs_to :genre

end
