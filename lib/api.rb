module Entities
  class App  < Grape::Entity
    expose :title, :image, :link, :description, :price
    expose :valid_until, :fb_share_text, :twitter_share_text, :email_share_text
  end
end

class API < Grape::API
  prefix  "api"
  version "v1"

  format :json
  default_format :json

  resource "apps" do
    get "/" do
      @apps = ::App.last_five_days
      present @apps, :with => Entities::App
    end
  end

end
