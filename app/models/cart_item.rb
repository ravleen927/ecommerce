class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 1 }
end
