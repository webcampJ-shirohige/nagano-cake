class Order < ApplicationRecord

  has_many :items, through: :order_details #n:mの関係を表現するアソシエーション。
  has_many :order_details, dependent: :destroy

  enum payment: { credit_card: 0, transfer: 1 }
  enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }

  def address_display
    '〒' + post_code + ' ' + address + ' ' + name
  end
end
