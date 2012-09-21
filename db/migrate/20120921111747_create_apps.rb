class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :title
      t.string :image
      t.string :link
      t.string :description
      t.decimal :price
      t.datetime :valid_until
      t.string :fb_share_text
      t.string :twitter_share_text
      t.string :email_share_text

      t.timestamps
    end
  end
end
