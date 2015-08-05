class AddImageToProducts < ActiveRecord::Migration
  def change
  	add_column :searches, :images, :text
  	add_column :products, :image, :text
  end
end
