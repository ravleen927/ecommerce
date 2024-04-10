class Product < ApplicationRecord
  belongs_to :category
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :reviews
  has_many :order_items
  has_one_attached :image
  paginates_per 10

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true


  def self.ransackable_attributes(auth_object = nil)
    %w[id name description price category_id created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[category] # Add other associations as needed
  end

  def self.search_by_keyword(keyword)
    if keyword.present?
      where("title LIKE ? OR description LIKE ?", "%#{keyword}%", "%#{keyword}%")
    else
      all
    end
  end
end
