# require 'pry'
# require 'nokogiri'
# require 'open-uri'
# require 'HTTParty'

# class Powell
# 	include HTTParty
# 	base_uri "https://www.powell.com/e2wItemQuickSearch.aspx?searchText="

# # part number more or less required

# 	def search number
# 		resp = self.class.get "#{number}&searchcondition=false&searchType=K"
# 		Nokogiri::HTML resp.body
# 	end
# end


# site = Powell.new
# d = site.search "OA109AN-11-2TB".gsub(" ","%20")

# binding.pry

# name = d.xpath("//table[@id='Table5']/tr[4]//span")[6].text
# price = d.xpath("//table[@id='Table5']/tr[4]//td[6]/table/tr[1]/td[2]")[0].text

# #quantity shown as time span

# # May be a SCRATCH
# # 		 -------  