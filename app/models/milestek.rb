require 'pry'
require 'nokogiri'
require 'open-uri'
require 'HTTParty'

class Milestek # Manufacturer primarily
	include HTTParty
	base_uri "http://www.milestek.com/cSearchs.aspx?Search="

	def self.search product
		resp = self.get "#{product}&CategoryID=0&ManufacturerID=0&SectionID=0&PriceRange=0&SortBy=5&PageSize=9&AndOr=AND&DisplayMode=Grid&x=0&y=0"
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

		# # Site makes the user click for quantity, but varying string prefixes
		# # make it so that I can't grab quantities for different searches.
		quantities = [] 
		5.times do quantities.push("see http://www.milestek.com/")
		end
		
		# Add "http://www.milestek.com/" + "" before
		# images = []
		# 1.upto(2) do |row|
		# 	1.upto(3) do |col|
		# 		thing = d.xpath("//table[@id='dlResultGrid']/tr[#{row}]/td[#{col}]//img")[0]
		# 		names.push(thing)
		# 		break if names.length >= 5
		# 	end
		source = "Milestek"
		
		Search.new(names, prices, quantities, source)
	end
end


