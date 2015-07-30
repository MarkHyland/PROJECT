class Search < ActiveRecord::Base
	attr_reader :names, :prices, :quantities, :source

	def initialize names, prices, quantities, source
		@names = names
		@prices = prices
		@quantities = quantities
		@source = source

		make_products	
	end

	def make_products
		if @names == nil || @prices == nil || @quantities == nil
			return []
		else
			0.upto(4).map{ |n|
				names = @names[n]
				prices = @prices[n]
				quantities = @quantities[n]
				source = @source
				Product.new(name: names, price: prices.gsub("$",""), quantity: quantities, source: source)
			}
		end
	end	
end
