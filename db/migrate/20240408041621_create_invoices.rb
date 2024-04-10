class CreateInvoices < ActiveRecord::Migration[7.1]
  def change
    create_table :invoices do |t|
      t.string :number
      t.string :customer_name
      t.decimal :total_amount

      t.timestamps
    end
  end
end
