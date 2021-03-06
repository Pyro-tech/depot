class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  PAYMENT_TYPES = ["現金", "クレジットカード", "注文書"]

  validates :name, :adress, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
      # ↑ item.order_id = id と同じだけど
      # 自分のidが無いので持つことができないので
      # かりで持たせておいて後で保存するためにこう書いてる
    end
  end
end
