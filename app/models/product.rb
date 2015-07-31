class Product < ActiveRecord::Base
	validates_presence_of :name, :price, :quantity

	# def in_stock?
	# 	super
 	#  	if quantity.downcase.include?(“in stock”) || quantity.to_i > 0
 	#    	return true
 	#  	else
 	#    	return false
 	#  	end
	# end
end
