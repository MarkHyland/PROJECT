class AddColumnsToSearch < ActiveRecord::Migration
  def change
  	add_column :searches, :names, :text
  	add_column :searches, :prices, :text
  	add_column :searches, :quantities, :text
  end
end
