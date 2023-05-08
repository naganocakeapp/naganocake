class Order < ApplicationRecord

  enum payment_method: { credit_card: 0, transfer: 1 }

  has_many :order_dateils
  belongs_to :customer

end
