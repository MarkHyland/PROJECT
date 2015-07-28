require 'pry'
require 'nokogiri'
require 'open-uri'
require 'HTTParty'
require 'json'

class Cdw # Huge Reseller
	include HTTParty
	base_uri "http://www.cdw.com/shop/search/result.aspx?key="

	def search product
		resp = self.class.get "#{product}&wclsscat=&b=&p=&ctlgfilter=&searchscope=all&sr=1&pfm=gln"
		Nokogiri::HTML resp.body
	end
end



# Every 3?
# quantity = d.xpath("//div[@id='pnlInfoModule']//span")[0].text
# quantity = d.xpath("//div[@id='pnlInfoModule']//span")[3].text
# fails at
# quantity = d.xpath("//div[@id='pnlInfoModule']//span")[15].text



