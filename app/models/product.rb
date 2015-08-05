class Product < ActiveRecord::Base
	validates_presence_of :name, :price, :quantity

	def in_stock?
 	 	if quantity.to_i > 0  
 	   		return true
 	 	elsif quantity.downcase.include?("in stock")
 	 		return true
 	 	else	
 	   		return false
 	 	end
	end
end

