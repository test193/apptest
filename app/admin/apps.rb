ActiveAdmin.register App do
  form do |f|
    f.inputs "Apps" do
      f.input :title
      f.input :description
      f.input :image, :as => :file
      f.input :remote_image_url
      f.input :link
      f.input :price
      f.input :new_price
      f.input :valid_until, :as => :just_datetime_picker
      f.input :fb_share_text
      f.input :twitter_share_text
      f.input :email_share_text
    end
    f.buttons
  end

  index do
    column :title
    column :description
    column "Image" do |app| 
      link_to image_tag(app.image_url(:thumb), :alt => "App image"), app.image_url
    end
    column :link
    column :price
    column :new_price
    column :valid_until
    column :fb_share_text
    column :twitter_share_text
    column :email_share_text
    default_actions
  end

  show do |app|
    attributes_table do
      row :title
      row :description
      row :image do
        link_to image_tag(app.image_url(:thumb), :alt => "App image"), app.image_url
      end
      row :link
      row :price
      row :new_price
      row :link
      row :fb_share_text
      row :twitter_share_text
      row :email_share_text
    end
  end
end