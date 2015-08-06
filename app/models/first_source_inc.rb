require 'pry'
require 'nokogiri'
require 'open-uri'
require 'httparty'

class FirstSourceInc # Small Reseller (12 manufacturers)
	include HTTParty
	base_uri "http://www.firstsourceinc.com"

# The part number is required

	def search number
		resp = self.class.get "/#{number}"
		Nokogiri::HTML resp.body
	end
end

site = FirstSourceInc.new
d = site.search "masw-001100-11900w"

# Have to click for quantity -- limits to one result

name = d.xpath("//div[@class='short-description']").text.strip
price = d.xpath("//div[@class='product-price']//span").text.strip
quantity = d.xpath("//div[@class='stock']//span[2]").text

# No individual images



# I MAY SCRATCH THIS ONE
# ----------------------

