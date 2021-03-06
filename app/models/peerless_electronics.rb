require 'pry'
require 'nokogiri'
require 'open-uri'
require 'httparty'

class PeerlessElectronics # Reseller
	include HTTParty
	base_uri "http://www.peerlesselectronics.com/store"

	def self.search_quantity number
		resp = self.get "/products/#{number}"
		@q = Nokogiri::HTML resp.body
	end

	def self.search product
		resp = self.get "/search.php?search_query=#{product}"
		d = Nokogiri::HTML resp.body

		names = 0.upto(4).map {|i| d.xpath("//div[@class='ProductDetails']//a")[i].text} rescue nil
		qs = names.map {|name| PeerlessElectronics.search_quantity name.gsub("-","%252d").gsub(" ","-")} rescue nil
		##
		prices = qs.map {|q| q.xpath("//em[@class='ProductPrice VariationProductPrice']").text} rescue nil
		quantities = qs.map {|q| q.xpath("//span[@class='VariationProductInventory']").text.strip} rescue nil
		images = 0.upto(4).map {|i| d.xpath("//div[@class='ProductImage']//img").map{|link| link['src']}[0]} rescue nil
		source = "Peerless Electronics"
		site_beg = ""
		site_end = 0.upto(4).map {|i| d.xpath("//div[@class='ProductDetails']//a").map{|link| link['href']}[i]}

		Search.new(names, prices, quantities, source, images, site_beg, site_end)
	end
end





