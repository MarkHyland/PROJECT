require 'pry'
require 'nokogiri'
require 'open-uri'
require 'HTTParty'

class PeerlessElectronics # Reseller
	include HTTParty
	base_uri "http://www.peerlesselectronics.com/store"

	def self.search product
		resp = self.get "/search.php?search_query=#{product}"
		d = Nokogiri::HTML resp.body

		names = 0.upto(4).map {|i| d.xpath("//div[@class='ProductDetails']//a")[i].text}
		prices = 0.upto(4).map {|i| d.xpath("//span[@class='ProductPrice']")[i].text}
		qs = names.map {|name| PeerlessElectronics.search_quantity name.gsub("-","%252d").gsub(" ","-")}
		quantities = qs.map {|q| @q.xpath("//span[@class='VariationProductInventory']").text.strip}
		images = 0.upto(4).map {|i| d.xpath("//div[@class='ProductImage']")[i]}
		source = "PeerlessElectronics"

		Search.new(names, prices, quantities, source)
	end

	def self.search_quantity number
		resp = self.get "/products/#{number}"
		@q = Nokogiri::HTML resp.body
	end
end





