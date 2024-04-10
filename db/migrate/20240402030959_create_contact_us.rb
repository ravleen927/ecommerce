class CreateContactUs < ActiveRecord::Migration[7.1]
  def change
    create_table :contact_us do |t|

      t.timestamps
    end
  end
end
