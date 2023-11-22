class Item < ApplicationRecord

  has_one_attached :image

  has_many :car_items
  has_many :order_details
  has_many :orders, through: :order_details #n:mの関係を表現するアソシエーション。
  belongs_to :genre

  #税込表示価格
  def item_total_price
    sprintf("%.2f", price_before_tax*1.10).sub(/\.?0+$/, '')
  end
end
