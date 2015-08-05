require 'open-uri'
require 'HTTParty'
require 'Nokogiri'
require 'pry'

class Alliedelec
	include HTTParty
	base_uri "http://www.alliedelec.com/search/results.aspx?term="

	def self.search product
		resp = self.get "#{product}"
		d = Nokogiri::HTML resp.body

		rows = 3.upto(7).map {|i| d.xpath("//table[@id='tblParts']/tr")[i]}
		if rows.include?(nil)
			names = nil
			prices = nil
			quantities = nil
			images = nil
		else
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
			site_end = rows.map {|row| row.xpath("td[3]//a").map{|link| link['href']}[0]}
		end
	
		source = "Alliedelec"
		# site_beg = "http://www.alliedelec.com/search/results.aspx?term="
		# site_end = "/"
		site_beg = "http://www.alliedelec.com"
		
		Search.new(names, prices, quantities, source, site_beg, site_end)
	end
end
