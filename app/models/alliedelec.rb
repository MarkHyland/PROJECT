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




















