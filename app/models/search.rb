class Search < ActiveRecord::Base
	attr_reader :names, :prices, :quantities, :source, :images, :site_beg, :site_end

	def initialize names, prices, quantities, source, images, site_beg, site_end
		@names = names
		@prices = prices
		@quantities = quantities
		@source = source
		@images = images
		@site_beg = site_beg
		@site_end = site_end

		make_products	
	end

	def make_products
		if @names == nil || @prices == nil || @quantities == nil || @images == nil
			return []
		else
			0.upto(4).map{ |n|
				names = @names[n]
				prices = @prices[n]
				quantities = @quantities[n]
				source = @source
				images = @images[n]
				site_beg = @site_beg
				site_end = @site_end[n]
				Product.new(name: names, price: prices.gsub("$",""), quantity: quantities, source: source, image: images, site_beg: site_beg, site_end: site_end)
			}
		end
	end	
end
