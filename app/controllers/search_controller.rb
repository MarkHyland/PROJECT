class SearchController < ApplicationController
	def index 
	end
	def grab
		site = Alliedelec.new
		d = site.search (params[:product]).gsub(" ","+")

		rows = 3.upto(7).map {|i| d.xpath("//table[@id='tblParts']/tr")[i]}
		names = rows.map {|row| row.xpath("td[3]//a").text}
		prices = rows.map do |row| 
			if row.xpath("td[6]//b").text.empty?
				row.xpath("td[6]//table[@id='tblPrice']//tr[1]/td[3]").text 
			else 
				row.xpath("td[6]//b").text 
			end
		end
		quantities = rows.map {|row| row.xpath("td[5]//b").text.strip}
		images = rows.map {|row| row.xpath("td[2]//img")}

		results = 0.upto(4).map {|i| [names[i],prices[i],quantities[i]]}

		## a = [result, result2, result3, result4, result5]

		# site = Cdw.new
		# d = site.search (params[:product]).gsub(" ","%20")

		# names = 0.upto(4).map {|i| d.xpath("//div[@class='searchrow-description']//a")[i].text}
		# prices = 0.upto(4).map {|i| d.xpath("//div[@class='ui-priceselector']//span[1]")[i].text}
		# quantities = (0..8).step(2).map {|i| d.xpath("//div[@id='pnlInfoModule']//span[@id='lblInfoMsg'][1]")[i].text}
		# images = 0.upto(4).map {|i| d.xpath("//div[@class='searchrow-image']//img")[i]}

		# site = Milestek.new
		# d = site.search "power cord".gsub(" ","+")

		# 3 column tables
		# names = []
		# 1.upto(2) do |row|
		# 	1.upto(3) do |col|
		# 		thing = d.xpath("//table[@id='dlResultGrid']/tr[#{row}]/td[#{col}]//b").text.strip
		# 		names.push(thing)
		# 		break if names.length >= 5
		# 	end
		# end

		# prices = []
		# 1.upto(2) do |row|
		# 	1.upto(3) do |col|
		# 		thing = d.xpath("//table[@id='dlResultGrid']/tr[#{row}]/td[#{col}]//strong")[1].text.delete("Price :")
		# 		prices.push(thing)
		# 		break if prices.length >= 5
		# 	end
		# end

		# # # Site makes the user click for quantity, but varying string prefixes
		# # # make it so that I can't grab quantities for different searches.
		# quantities = [] 
		# 5.times do quantities.push("see sitehttp://www.milestek.com/")
		# end
		
		# # Add "http://www.milestek.com/" + "" before
		# images = []
		# 1.upto(2) do |row|
		# 	1.upto(3) do |col|
		# 		thing = d.xpath("//table[@id='dlResultGrid']/tr[#{row}]/td[#{col}]//img")[0]
		# 		names.push(thing)
		# 		break if names.length >= 5
		# 	end
		# end

		# site = PeerlessElectronics.new
		# d = site.search "cord".gsub(" ","+")

		# # Part number
		# names = 0.upto(4).map {|i| d.xpath("//div[@class='ProductDetails']//a")[i].text}
		# prices = 0.upto(4).map {|i| d.xpath("//span[@class='ProductPrice']")[i].text}
		# # Site makes the user click for quantity, so I have to pass in each name into a new
		# # method searching for quantity. 
		# qs = names.map {|name| site.search_quantity name.gsub("-","%252d")}
		# quantities = qs.map {|q| q.xpath("//span[@class='VariationProductInventory']").text.strip}
		# images = 0.upto(4).map {|i| d.xpath("//div[@class='ProductImage']")[i]}
	end
end

