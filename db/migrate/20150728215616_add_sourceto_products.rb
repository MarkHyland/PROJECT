class AddSourcetoProducts < ActiveRecord::Migration
  def change
  	add_column :products, :source, :string
  end
end
