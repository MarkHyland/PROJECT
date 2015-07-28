class SearchController < ApplicationController
	def index
	end

	def grab_allie 
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

		render json: [result, result2, result3, result4, result5]
	end

	def grab_cdw
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

		result  = [name,  price,   quantity]
		result2 = [name2, price2, quantity2]
		result3 = [name3, price3, quantity3]
		result4 = [name4, price4, quantity4]
		result5 = [name5, price5, quantity5]

		render json: [result, result2, result3, result4, result5]
	end

	def grab_milestek
	end
	
	def grab_peerless
	end
end
