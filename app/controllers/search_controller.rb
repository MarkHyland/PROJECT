class SearchController < ApplicationController
	def index 
	end
	def grab
		site = Alliedelec.new
		d = site.search (params[:product]).gsub(" ","+")

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

		result =  [name, price,  quantity]
		result2 = [name2,price2,quantity2]
		result3 = [name3,price3,quantity3]
		result4 = [name4,price4,quantity4]
		result5 = [name5,price5,quantity5]

		a = [result, result2, result3, result4, result5]
	
		site = Cdw.new
		d = site.search (params[:product]).gsub(" ","%20")

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

		result  = [name,  price,   quantity]
		result2 = [name2, price2, quantity2]
		result3 = [name3, price3, quantity3]
		result4 = [name4, price4, quantity4]
		result5 = [name5, price5, quantity5]

		b = [result, result2, result3, result4, result5]

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

		result  = [name,  price,   quantity]
		result2 = [name2, price2, quantity2]
		result3 = [name3, price3, quantity3]
		result4 = [name4, price4, quantity4]
		result5 = [name5, price5, quantity5]

		c = [result, result2, result3, result4, result5]

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

		result  = [name,  price,   quantity]
		result2 = [name2, price2, quantity2]
		result3 = [name3, price3, quantity3]
		result4 = [name4, price4, quantity4]
		result5 = [name5, price5, quantity5]

		d = [result, result2, result3, result4, result5]

		render json: a + b + c + d
	end
end
