class Order < ApplicationRecord

  has_many :items, through: :order_details #n:mの関係を表現するアソシエーション。
  has_many :order_details, dependent: :destroy
end
