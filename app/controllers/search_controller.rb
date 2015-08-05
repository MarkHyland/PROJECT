class SearchController < ApplicationController
	def index 
	end

	def grab
		start = Time.now
		
		res_a, res_c, res_m, res_p = [],[],[],[]
		t1 = Thread.new do
			miles = Milestek.search params[:product].gsub(" ","+")
			res_m = miles.make_products
			end
		t2 = Thread.new do
			cedewu = CDW.search params[:product].gsub(" ","%20")
			res_c = cedewu.make_products
			end
		t3 = Thread.new do 
			allie = Alliedelec.search params[:product].gsub(" ","+")
			res_a = allie.make_products
			end
		t4 = Thread.new do
			peer = PeerlessElectronics.search params[:product].gsub(" ","+")
			res_p = peer.make_products
			end

		middle0 = Time.now
		t1.join
		middle1 = Time.now
		t2.join
		middle2 = Time.now
		t3.join
		middle3 = Time.now
		t4.join
		middle4 = Time.now

		res = res_a.concat res_c.concat res_m.concat res_p  
		present,absent = res.partition{|v| v.in_stock? }

		@results = present.sort_by{|h| h[:price]} + absent.sort_by{|h| h[:price]}

		stop = Time.now
		@time = stop - start
		@mile = middle1 - middle0
		@cedew = middle2 - middle1
		@alli = middle3 - middle2
		@pee = middle4 - middle3
	end
end

