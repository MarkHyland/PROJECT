class Product < ActiveRecord::Base
	validates_presence_of :name, :price, :quantity

	def price
		super.try(:to_f)
	end
end
