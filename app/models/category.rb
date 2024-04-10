class Category < ApplicationRecord
  # Your model code here
  has_many :products
  validates :name, presence: true, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["products"]
  end
  

  # Your other model code here
end
