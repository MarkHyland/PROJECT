require 'pry'
require 'nokogiri'
require 'open-uri'
require 'HTTParty'
require 'json'

class CDW # Huge Reseller
	include HTTParty
	base_uri "http://www.cdw.com/shop/search/result.aspx?key="

	def self.search product
		resp = self.get "#{product}&wclsscat=&b=&p=&ctlgfilter=&searchscope=all&sr=1&pfm=gln"
		d = Nokogiri::HTML resp.body

		names = 0.upto(4).map {|i| d.xpath("//div[@class='searchrow-description']//a")[i].text}
		prices = 0.upto(4).map {|i| d.xpath("//div[@class='ui-priceselector']//span[1]")[i].text}
		quantities = (0..8).step(2).map {|i| d.xpath("//div[@id='pnlInfoModule']//span[@id='lblInfoMsg'][1]")[i].text}
		images = 0.upto(4).map {|i| d.xpath("//div[@class='searchrow-image']//img")[i]}
		source = "CDW"

		Search.new(names, prices, quantities, source)
	end
end





