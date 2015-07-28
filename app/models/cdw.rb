require 'pry'
require 'nokogiri'
require 'open-uri'
require 'HTTParty'

class Cdw # Huge Reseller
	include HTTParty
	base_uri "http://www.cdw.com/shop/search/result.aspx?key="

	def search product
		resp = self.class.get "#{product}&wclsscat=&b=&p=&ctlgfilter=&searchscope=all&sr=1&pfm=gln"
		Nokogiri::HTML resp.body
	end
end

site = Cdw.new
d = site.search "power strip".gsub(" ","%20")

name = d.xpath("//div[@class='searchrow-description']//a")[0].text
name2 = d.xpath("//div[@class='searchrow-description']//a")[1].text
name3 = d.xpath("//div[@class='searchrow-description']//a")[2].text
name4 = d.xpath("//div[@class='searchrow-description']//a")[3].text
name5 = d.xpath("//div[@class='searchrow-description']//a")[4].text

price = d.xpath("//div[@class='ui-priceselector']//span[1]")[0].text
price2 = d.xpath("//div[@class='ui-priceselector']//span[1]")[1].text
price3 = d.xpath("//div[@class='ui-priceselector']//span[1]")[2].text
price4 = d.xpath("//div[@class='ui-priceselector']//span[1]")[3].text
price5 = d.xpath("//div[@class='ui-priceselector']//span[1]")[4].text

# Every 2
quantity = d.xpath("//div[@id='pnlInfoModule']//span[@id='lblInfoMsg'][1]")[0].text
quantity2 = d.xpath("//div[@id='pnlInfoModule']//span[@id='lblInfoMsg'][1]")[2].text
quantity3 = d.xpath("//div[@id='pnlInfoModule']//span[@id='lblInfoMsg'][1]")[4].text
quantity4 = d.xpath("//div[@id='pnlInfoModule']//span[@id='lblInfoMsg'][1]")[6].text
quantity5 = d.xpath("//div[@id='pnlInfoModule']//span[@id='lblInfoMsg'][1]")[8].text

# weblink
image = d.xpath("//div[@class='searchrow-image']//img")[0]
image2 = d.xpath("//div[@class='searchrow-image']//img")[1]
image3 = d.xpath("//div[@class='searchrow-image']//img")[2]
image4 = d.xpath("//div[@class='searchrow-image']//img")[3]
image5 = d.xpath("//div[@class='searchrow-image']//img")[4]

binding.pry

# Every 3?
# quantity = d.xpath("//div[@id='pnlInfoModule']//span")[0].text
# quantity = d.xpath("//div[@id='pnlInfoModule']//span")[3].text
# fails at
# quantity = d.xpath("//div[@id='pnlInfoModule']//span")[15].text



