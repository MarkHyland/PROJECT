class AddColumnsToSearches < ActiveRecord::Migration
  def change
  	add_column :searches, :site_beg, :string
  	add_column :searches, :site_end, :string
  	add_column :products, :site_beg, :string
  	add_column :products, :site_end, :string
  end
end
