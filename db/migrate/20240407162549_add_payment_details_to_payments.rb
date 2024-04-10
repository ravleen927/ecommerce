class AddPaymentDetailsToPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :payments, :card_number, :string
    add_column :payments, :expiry_date, :date
    add_column :payments, :cvv, :string
  end
end
