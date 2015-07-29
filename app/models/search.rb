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
		0.upto(4).map{ |n|
			names = @names[n]
			prices = @prices[n]
			quantities = @quantities[n]
			source = @source
			Product.create!(name: names, price: prices.gsub(/[^\d^\.]/, '').to_f, quantity: quantities.to_i, source: source)
		}
	end	
end
