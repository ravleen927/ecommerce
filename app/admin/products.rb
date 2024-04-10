ActiveAdmin.register Product do
  # Ensure that you have defined all necessary permit_params for attributes
  permit_params :name, :description, :price, :image, :category_id, :on_sale

  # Optionally, you might have defined filters, check if there's any reference to reviews_id_eq
  filter :name
  filter :description
  filter :category
  filter :price

  # Define your index view
  index do
    selectable_column
    column :id
    column :name
    column :description
    column :category
    column :price
    column :on_sale
    column :image do |product|
      if product.image.attached?
        image_tag(url_for(product.image), height: '50')
      else
        "No Image"
      end
    end
    actions 
  end

  # Define your show view
  show do
    attributes_table do
      row :id
      row :name
      row :description
      row :category
      row :price
      row :on_sale
      row :image do |product|
        if product.image.attached?
          image_tag(url_for(product.image))
        else
          "No Image"
        end
      end
    end
  end

  # Define your form view
  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :description
      f.input :category_id, as: :select, collection: Category.all.map { |c| [c.name, c.id] }
      f.input :price
      f.input :on_sale
      f.input :image, as: :file
    end
    f.actions


  end
end
