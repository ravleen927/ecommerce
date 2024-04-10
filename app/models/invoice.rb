class Invoice < ApplicationRecord
    belongs_to :order
  
    validates :subtotal, :taxes, :total, presence: true
    validates :subtotal, :taxes, :total, numericality: { greater_than_or_equal_to: 0 }
  end
  