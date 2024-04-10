# app/models/line_item.rb
class LineItem < ApplicationRecord
  belongs_to :invoice

  # Other associations and validations can be added as needed
end
