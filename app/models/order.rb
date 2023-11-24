class Order < ApplicationRecord

  has_many :items, through: :order_details #n:mの関係を表現するアソシエーション。
  has_many :order_details, dependent: :destroy

  enum payment: { credit_card: 0, transfer: 1 }

  def address_display
    '〒' + post_code + ' ' + address + ' ' + name
  end
end
