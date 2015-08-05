class Search < ActiveRecord::Base
	attr_reader :names, :prices, :quantities, :source, :site_beg, :site_end

	def initialize names, prices, quantities, source, site_beg, site_end
		@names = names
		@prices = prices
		@quantities = quantities
		@source = source
		@site_beg = site_beg
		@site_end = site_end

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
				site_beg = @site_beg
				site_end = @site_end
				Product.new(name: names, price: prices.gsub("$",""), quantity: quantities, source: source, site_beg: site_beg, site_end: site_end)
			}
		end
	end	
end
