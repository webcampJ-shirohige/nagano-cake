class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  def subtotal
    item.item_total_price * amount
  end
end
