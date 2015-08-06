# require 'pry'
# require 'nokogiri'
# require 'open-uri'
# require 'httparty'

# class Arrow # Huge Reseller
# 	include HTTParty
# 	base_uri "https://parts.arrow.com/item/search/#st="


# 	def search product
# 		resp = self.class.get "#{product}"
# 		Nokogiri::HTML resp.body
# 	end
# end


# site = Arrow.new
# d = site.search "Power Strip".gsub(" ","%20")

# # Arrow has varying query string suffixes so I can't implement
# # the search-box feature.
# # 	SCRATCH
# # 	-------
