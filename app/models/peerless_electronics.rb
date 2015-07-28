require 'pry'
require 'nokogiri'
require 'open-uri'
require 'HTTParty'

class PeerlessElectronics # Reseller
	include HTTParty
	base_uri "http://www.peerlesselectronics.com/store"
#/search.php?search_query=

	def search product
		resp = self.class.get "/search.php?search_query=#{product}"
		Nokogiri::HTML resp.body
	end

# Slower with the additional method

	def search_quantity number
		resp = self.class.get "/products/#{number}"
		Nokogiri::HTML resp.body
	end
end


site = PeerlessElectronics.new
d = site.search "cord".gsub(" ","+")

# Part number
name = d.xpath("//div[@class='ProductDetails']//a")[0].text
name2 = d.xpath("//div[@class='ProductDetails']//a")[1].text
name3 = d.xpath("//div[@class='ProductDetails']//a")[2].text
name4 = d.xpath("//div[@class='ProductDetails']//a")[3].text
name5 = d.xpath("//div[@class='ProductDetails']//a")[4].text

price = d.xpath("//span[@class='ProductPrice']")[0].text
price2 = d.xpath("//span[@class='ProductPrice']")[1].text
price3 = d.xpath("//span[@class='ProductPrice']")[2].text
price4 = d.xpath("//span[@class='ProductPrice']")[3].text
price5 = d.xpath("//span[@class='ProductPrice']")[4].text

# They make you click for quantity -- requires extra method.
# q will not be used. It works similarly to row".
q = site.search_quantity name.gsub("-","%252d")
q2 = site.search_quantity name2.gsub("-","%252d")
q3 = site.search_quantity name3.gsub("-","%252d")
q4 = site.search_quantity name4.gsub("-","%252d")
q5 = site.search_quantity name5.gsub("-","%252d")

quantity = q.xpath("//span[@class='VariationProductInventory']").text.strip
quantity2 = q2.xpath("//span[@class='VariationProductInventory']").text.strip
quantity3 = q3.xpath("//span[@class='VariationProductInventory']").text.strip
quantity4 = q4.xpath("//span[@class='VariationProductInventory']").text.strip
quantity5 = q5.xpath("//span[@class='VariationProductInventory']").text.strip

image = d.xpath("//div[@class='ProductImage']")[0]
image2 = d.xpath("//div[@class='ProductImage']")[1]
image3 = d.xpath("//div[@class='ProductImage']")[2]
image4 = d.xpath("//div[@class='ProductImage']")[3]
image5 = d.xpath("//div[@class='ProductImage']")[4]

binding.pry
