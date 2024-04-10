# app/models/payment.rb
class Payment < ApplicationRecord
    # Add validations as needed
    validates :card_number, presence: true
    validates :expiry_date, presence: true
    validates :cvv, presence: true
  end
  