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


site = Milestek.new
d = site.search "power cord".gsub(" ","+")

# 3 column tables
row = d.xpath("//table[@id='dlResultGrid']/tr[1]")
row2 = d.xpath("//table[@id='dlResultGrid']/tr[2]")
row3 = d.xpath("//table[@id='dlResultGrid']/tr[3]")
 
name = row.xpath("td[1]//b").text.strip
name2 = row.xpath("td[2]//b").text.strip
name3 = row.xpath("td[3]//b").text.strip
name4 = row2.xpath("td[1]//b").text.strip
name5 = row2.xpath("td[2]//b").text.strip

price = row.xpath("td[1]//strong")[1].text.delete("Price :")
price2 = row.xpath("td[2]//strong")[1].text.delete("Price :")
price3 = row.xpath("td[3]//strong")[1].text.delete("Price :")
price4 = row2.xpath("td[1]//strong")[1].text.delete("Price :")
price5 = row2.xpath("td[2]//strong")[1].text.delete("Price :")

# They make you click for quantity. Varying string prefixes
# so I can't implement it.
quantity = "see sitehttp://www.milestek.com/"
quantity2 = "see sitehttp://www.milestek.com/"
quantity3 = "see sitehttp://www.milestek.com/"
quantity4 = "see http://www.milestek.com/"
quantity5 = "see http://www.milestek.com/"

# Add "http://www.milestek.com/" + "" before
image = row.xpath("td[1]//img")[0] 
image2 = row.xpath("td[2]//img")[0]
image3 = row.xpath("td[3]//img")[0]
image4 = row.xpath("td[1]//img")[0]
image5 = row.xpath("td[2]//img")[0]

binding.pry

# I tried some different things for price, but could not get
# anything reasonable. For this reason, I think that grabbing 
# from tables is more difficult.
# 
# price = d.xpath("//strong")[3].text.delete("Price: ")
# price = d.xpath("//div[@id='dlResultGrid_ctl01_pnlPrice']").text.strip.delete("Price: ")
