class App < ActiveRecord::Base
  attr_accessible :description, :email_share_text, :fb_share_text, :image, :link, :price, :title, :twitter_share_text, :valid_until

  scope :last_five_days, lambda { where("created_at > ?", 5.days.ago.to_date) }

end
