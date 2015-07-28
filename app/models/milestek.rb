require 'pry'
require 'nokogiri'
require 'open-uri'
require 'HTTParty'

class Milestek # Manufacturer primarily
	include HTTParty
	base_uri "http://www.milestek.com/cSearchs.aspx?Search="

	def search product
		resp = self.class.get "#{product}&CategoryID=0&ManufacturerID=0&SectionID=0&PriceRange=0&SortBy=5&PageSize=9&AndOr=AND&DisplayMode=Grid&x=0&y=0"
		Nokogiri::HTML resp.body
	end
end



# I tried some different things for price, but could not get
# anything reasonable. For this reason, I think that grabbing 
# from tables is more difficult.
# 
# price = d.xpath("//strong")[3].text.delete("Price: ")
# price = d.xpath("//div[@id='dlResultGrid_ctl01_pnlPrice']").text.strip.delete("Price: ")
