require 'pry'
require 'nokogiri'
require 'open-uri'
require 'HTTParty'

class Milestek # Manufacturer primarily
	include HTTParty
	base_uri "http://www.milestek.com"

	def self.search_quantity link
		resp = self.get "/#{link}"
		@q = Nokogiri::HTML resp.body
	end

	def self.search product
		resp = self.get "/cSearchs.aspx?Search=#{product}&CategoryID=0&ManufacturerID=0&SectionID=0&PriceRange=0&SortBy=5&PageSize=9&AndOr=AND&DisplayMode=Grid&x=0&y=0"
		d = Nokogiri::HTML resp.body

		names = []
		1.upto(2) do |row|
			1.upto(3) do |col|
				thing = d.xpath("//table[@id='dlResultGrid']/tr[#{row}]/td[#{col}]//b").text.strip
				names.push(thing)
				break if names.length >= 5
			end
		end

		prices = []
		1.upto(2) do |row|
			1.upto(3) do |col|
				thing = d.xpath("//table[@id='dlResultGrid']/tr[#{row}]/td[#{col}]//strong")[1].text.delete("Price :") rescue nil
				prices.push(thing)
				break if prices.length >= 5
			end
		end

		if prices.include?(nil)
			prices = nil
		else
		end

		# # Site makes the user click for quantity, but varying string prefixes
		# # make it so that I can't grab quantities for different searches.
		# # USE THE LINK
		# quantities = [] 
		# 5.times do quantities.push("see http://www.milestek.com/")
		# end

		site_end = []
		1.upto(2) do |row|
			1.upto(3) do |col|
				thing = d.xpath("//table[@id='dlResultGrid']/tr[#{row}]/td[#{col}]//a").map{|link| link['href']}[0]
				site_end.push(thing)
				break if site_end.length >= 5
			end
		end

		qs = site_end.map {|site_end| Milestek.search_quantity site_end}
		quantities = qs.map {|q| q.xpath("//p[@class='item-avialable']//span").text.strip} 

		
		# Add "http://www.milestek.com/" + "" before
		# images = []
		# 1.upto(2) do |row|
		# 	1.upto(3) do |col|
		# 		thing = d.xpath("//table[@id='dlResultGrid']/tr[#{row}]/td[#{col}]//img")[0]
		# 		names.push(thing)
		# 		break if names.length >= 5
		# 	end
		source = "Milestek"
		# site_beg = "http://www.milestek.com/cSearchs.aspx?Search="
		# site_end = "&CategoryID=0&ManufacturerID=0&SectionID=0&PriceRange=0&SortBy=5&PageSize=9&AndOr=AND&DisplayMode=Grid&x=0&y=0"
		site_beg = "http://www.milestek.com/"
		
		
		
		Search.new(names, prices, quantities, source, site_beg, site_end)
	end
end



