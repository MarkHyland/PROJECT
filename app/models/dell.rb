require 'open-uri'
require 'httparty'
require 'nokogiri'
require 'pry'

class Dell
	include HTTParty
	base_uri "http://pilot.search.dell.com/"

	# def self.search product
	# 	resp = self.get "#{product}"
	# 	Nokogiri::HTML resp.body
	# 	source = "Dell"
		
	# 	Search.new(names, prices, quantities, source)
	# end

	resp = self.get "http://pilot.search.dell.com/cable"
	d = Nokogiri::HTML resp.body

	binding.pry
	
	binding.pry
end