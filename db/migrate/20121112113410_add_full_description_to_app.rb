class AddFullDescriptionToApp < ActiveRecord::Migration
  def change
    add_column :apps, :full_description, :text
  end
end
