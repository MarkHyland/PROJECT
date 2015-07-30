class AddScaleToSearches < ActiveRecord::Migration
  def change
  	change_column :searches, :prices, :decimal, :precision => 10, :scale => 2
  end
end
