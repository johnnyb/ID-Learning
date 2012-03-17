class SeminarsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :setup_seminar


	private

	def setup_seminar
		@seminar = Seminar.find(params[:id]) unless params[:id].blank?
	end
end
