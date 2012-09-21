class AddNewPriceToApp < ActiveRecord::Migration
  def change
    add_column :apps, :new_price, :decimal
  end
end
