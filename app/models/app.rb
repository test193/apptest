class App < ActiveRecord::Base
  attr_accessible :remote_image_url, :description, :email_share_text, :new_price,
                  :fb_share_text, :image, :link, :price, :title, :twitter_share_text, :full_description
  just_define_datetime_picker :valid_until, :add_to_attr_accessible => true
  mount_uploader :image, ImageUploader

  scope :last_five_days, lambda { where("created_at > ?", 5.days.ago.to_date) }
end
