Appmania::Application.routes.draw do
  mount API => "/"
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
end
