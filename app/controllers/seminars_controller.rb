class SeminarsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :setup_seminar

	def create
		@seminar = Seminar.new(params[:seminar])
		@seminar.professor_user = current_user
		@seminar.save!
		flash[:notice] = "Seminar successfully created"
		redirect_to [:edit, @seminar]
	end

	def update
		@seminar.update_attributes!(params[:seminar])
		flash[:notice] = "Seminar successfully updated"
		redirect_to [:edit, @seminar]
	end

	def destroy
		@seminar.active = false
		@seminar.save!
		flash[:notice] = "Seminar successfully removed"
		redirect_to mine_seminars_path
	end

	private

	def setup_seminar
		@seminar = Seminar.find(params[:id]) unless params[:id].blank?
	end
end
