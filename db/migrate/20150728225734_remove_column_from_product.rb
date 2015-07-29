class RemoveColumnFromProduct < ActiveRecord::Migration
  def change
  	remove_column :products, :search_id
  end
end
