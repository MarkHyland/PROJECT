# require 'pry'
# require 'nokogiri'
# require 'open-uri'
# require 'HTTParty'

# class ComponentsArrow # (Arrow) Huge Reseller 
# 	include HTTParty
# 	base_uri "http://components.arrow.com/part/search/"

# 	def search product
# 		resp = self.class.get "#{product}"
# 		Nokogiri::HTML resp.body
# 	end
# end

# site = ComponentsArrow.new
# d = site.search "connector".gsub(" ","%20")

# binding.pry

# row = d.xpath("//table[@id='results-table']//tr")

# # Why isn't it grabbing the table?
