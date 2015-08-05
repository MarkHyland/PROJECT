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

		names = 0.upto(4).map {|i| d.xpath("//a[@id='hprProductLink']")[i].text} rescue nil
		prices = 0.upto(4).map {|i| d.xpath("//div[@class='ui-priceselector']//span[1]")[i].text} rescue nil
		quantities = (0..8).step(2).map {|i| d.xpath("//div[@id='pnlInfoModule']//span[@id='lblInfoMsg'][1]")[i].text} rescue nil
		images = 0.upto(4).map {|i| d.xpath("//div[@class='searchrow-image']//img")[i]}.map{|link| link['src']} rescue nil
		# images = 0.upto(4).map {|i| d.xpath("//div[@class='searchrow-image']//img").map{|link| link['src']}[i]} rescue nil
		
		source = "CDW"
		# site_beg = "http://www.cdw.com/shop/search/result.aspx?key="
		# site_end = "&wclsscat=&b=&p=&ctlgfilter=&searchscope=all&sr=1&pfm=gln"
		site_beg = "http://www.cdw.com"
		site_end = 0.upto(4).map {|i| d.xpath("//a[@id='hprProductLink']").map{|link| link['href']}[i]}

		Search.new(names, prices, quantities, source, images, site_beg, site_end)
	end
end





