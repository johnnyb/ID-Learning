class ApplicationController < ActionController::Base
	protect_from_forgery

	def last_position(coll)
		val = coll.position_order.last
		return 0 if val.nil?
		return val.position || 0
	end 

	def sort_array_with_position(ary, lst)
		vals = lst.split(",").map{|x| x.to_i}
		ary.each do |mem|
			idx = vals.index(mem.id)
			unless idx.nil?
				mem.position = idx
				mem.save!
			end
		end
	end
end
