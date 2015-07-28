require 'open-uri'
require 'HTTParty'
require 'Nokogiri'
require 'pry'

class Alliedelec # Huge Reseller
	include HTTParty
	base_uri "http://www.alliedelec.com/search/results.aspx?term="

	def search product
		resp = self.class.get "#{product}"
		Nokogiri::HTML resp.body
	end
end

site = Alliedelec.new
d = site.search "connector".gsub(" ","+")

# Rows 0 - 3 are header stuff
row = d.xpath("//table[@id='tblParts']/tr")[3]
row2 = d.xpath("//table[@id='tblParts']/tr")[4]
row3 = d.xpath("//table[@id='tblParts']/tr")[5]
row4 = d.xpath("//table[@id='tblParts']/tr")[6]
row5 = d.xpath("//table[@id='tblParts']/tr")[7]

name = row.xpath("td[3]//a").text
name2 = row2.xpath("td[3]//a").text
name3 = row3.xpath("td[3]//a").text
name4 = row4.xpath("td[3]//a").text
name5 = row5.xpath("td[3]//a").text

if ! row.xpath("td[6]//b").text.empty?
	price = row.xpath("td[6]//b").text
else 
	price = row.xpath("td[6]//table[@id='tblPrice']//tr[1]/td[3]").text
end
if ! row2.xpath("td[6]//b").text.empty?
	price2 = row2.xpath("td[6]//b").text
else 
	price2 = row2.xpath("td[6]//table[@id='tblPrice']//tr[1]/td[3]").text
end
if ! row3.xpath("td[6]//b").text.empty?
	price3 = row3.xpath("td[6]//b").text
else 
	price3 = row3.xpath("td[6]//table[@id='tblPrice']//tr[1]/td[3]").text
end
if ! row4.xpath("td[6]//b").text.empty?
	price4 = row4.xpath("td[6]//b").text
else 
	price4 = row4.xpath("td[6]//table[@id='tblPrice']//tr[1]/td[3]").text
end
if ! row5.xpath("td[6]//b").text.empty?
	price5 = row5.xpath("td[6]//b").text
else 
	price5 = row5.xpath("td[6]//table[@id='tblPrice']//tr[1]/td[3]").text
end

quantity = row.xpath("td[5]//b").text.strip
quantity2 = row2.xpath("td[5]//b").text.strip
quantity3 = row3.xpath("td[5]//b").text.strip
quantity4 = row4.xpath("td[5]//b").text.strip
quantity5 = row5.xpath("td[5]//b").text.strip

image = row.xpath("td[2]//img")
image2 = row2.xpath("td[2]//img")
image3 = row3.xpath("td[2]//img")
image4 = row4.xpath("td[2]//img")
image5 = row5.xpath("td[2]//img")

binding.pry

# See about making a loop:

# for i in 1..5
# 	row(i) = d.xpath("//table[@id='tblParts']/tr")[i+2]
# end


















