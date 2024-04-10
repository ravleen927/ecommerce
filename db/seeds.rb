# Seed categories
categories = ['T-shirts', 'Jeans', 'Skirts', 'Dresses', 'Tops']

categories.each do |category_name|
  Category.find_or_create_by(name: category_name)
end

# Seed admin user
AdminUser.create!(email: 'admin32@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# Seed products
categories.each do |category_name|
  category = Category.find_by(name: category_name)
  25.times do
    product = Product.create(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price(range: 10.0..1000.0),
      category: category
    )
    puts "Created product: #{product.name} in category: #{category.name}"
  end
end

# Seed provinces of Canada
require 'countries'

# Retrieve provinces of Canada
provinces_of_canada = ISO3166::Country['CA'].subdivisions.values

# Seed the provinces table
provinces_of_canada.each do |province|
  Province.find_or_create_by(name: province['name'])
end
