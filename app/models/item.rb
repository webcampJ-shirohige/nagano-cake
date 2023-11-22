class Item < ApplicationRecord

  has_one_attached :image

  has_many :cart_items
  has_many :order_details
  has_many :orders, through: :order_details #n:mの関係を表現するアソシエーション。
  belongs_to :genre

  #税込表示価格
  def item_total_price
    sprintf("%.2f", price_before_tax*1.10).sub(/\.?0+$/, '')
  end

  #カート内で商品の画像を表示させる
  def display_image
    if image.attached?
      image.variant(resize_to_limit: [100, 100]).processed
    else
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      file_path.to_s
    end
  end
end