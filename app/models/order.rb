class Order < ApplicationRecord

  has_many :items, through: :order_details #n:mの関係を表現するアソシエーション。
  has_many :order_details, dependent: :destroy

  enum payment: { credit_card: 0, transfer: 1 }

  enum status: {
    waiting_payment: 0,
    confirm_payment: 1,
    shipped: 2,
    out_of_delivery: 3,
    delivered: 4
  }
  enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }

  def address_display
    '〒' + post_code + ' ' + address + ' ' + name
  end

  def total_piece
    total = 0
    order_details.each do |order_detail|
      total += order_detail.piece
    end
    return total
  end
end
