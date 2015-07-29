class SearchController < ApplicationController
	def index 
	end

	def grab
		allie = Alliedelec.search params[:product].gsub(" ","+")
		cedewu = CDW.search params[:product].gsub(" ","%20")
		miles = Milestek.search params[:product].gsub(" ","+")
		peer = PeerlessElectronics.search params[:product].gsub(" ","+")

		# results = allie + cedewu + miles + peer
		# results.sort_by {|p| p[2]}
	end
end

