class ApplicationController < ActionController::Base
	protect_from_forgery

	def last_position(coll)
		val = coll.position_order.last
		return 0 if val.nil?
		return val.position || 0
	end 
end
