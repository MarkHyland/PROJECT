class SearchController < ApplicationController
	def index 
	end

	def grab
		start = Time.now
		
		res_a, res_c, res_m, res_p = [],[],[],[]
		t1 = Thread.new do
			allie = Alliedelec.search params[:product].gsub(" ","+")
			res_a = allie.make_products
			end
		t2 = Thread.new do
			cedewu = CDW.search params[:product].gsub(" ","%20")
			res_c = cedewu.make_products
			end
		t3 = Thread.new do 
			miles = Milestek.search params[:product].gsub(" ","+")
			res_m = miles.make_products
			end
		t4 = Thread.new do
			peer = PeerlessElectronics.search params[:product].gsub(" ","+")
			res_p = peer.make_products
			end

		t1.join
		t2.join
		t3.join
		t4.join

		res = res_a.concat res_c.concat res_m.concat res_p  
		@results = res.sort_by{|h| h[:price]}

		stop = Time.now
		@time = stop - start
	end
end

