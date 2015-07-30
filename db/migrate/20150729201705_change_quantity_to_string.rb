class ChangeQuantityToString < ActiveRecord::Migration
  def change
  	change_column :products, :quantity, :string
  end
end
