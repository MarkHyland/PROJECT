require 'pry'
require 'nokogiri'
require 'open-uri'
require 'HTTParty'

class PeerlessElectronics # Reseller
	include HTTParty
	base_uri "http://www.peerlesselectronics.com/store"
#/search.php?search_query=

	def search product
		resp = self.class.get "/search.php?search_query=#{product}"
		Nokogiri::HTML resp.body
	end

# Slower with the additional method

	def search_quantity number
		resp = self.class.get "/products/#{number}"
		Nokogiri::HTML resp.body
	end
end





