class SearchController < ApplicationController
	def index 
	end

	def grab
		allie = Alliedelec.search params[:product].gsub(" ","+")
		cedewu = CDW.search params[:product].gsub(" ","%20")
		miles = Milestek.search params[:product].gsub(" ","+")
		peer = PeerlessElectronics.search params[:product].gsub(" ","+")

		res_a = allie.make_products
		res_c = cedewu.make_products
		res_m = miles.make_products
		res_p = peer.make_products
		
		res = res_a.concat res_c.concat res_m.concat res_p  
		@results = res.sort_by{|h| h[:price]}
	end
end

