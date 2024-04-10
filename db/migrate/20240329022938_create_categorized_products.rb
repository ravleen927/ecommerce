class CreateCategorizedProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :categorized_products do |t|
      t.belongs_to :category, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
