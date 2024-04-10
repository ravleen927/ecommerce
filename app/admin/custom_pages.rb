# app/admin/custom_pages.rb
ActiveAdmin.register_page 'Custom Pages' do
    menu priority: 4, label: 'About Us'
  
    content title: 'About Us' do
      about_content = AboutContent.find_by(title: 'About Us')
  
      if about_content
        div class: 'about-us-content' do
          h2 about_content.title
          div class: 'content' do
            raw about_content.content
          end
        end
      else
        div class: 'no-content-message' do
          'About Us content not found.'
        end
      end
    end
  end
  