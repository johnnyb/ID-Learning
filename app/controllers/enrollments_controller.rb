class EnrollmentsController < ApplicationController
	before_filter :setup_enrollment

	def create
		raise "Invalid user!" unless @seminar.professor_user == current_user
		@enrollment = @seminar.seminar_studnets.create!(:student_user_id => params[:student_user_id], :professor_confirmed => true)
		flash[:notice] = "Student enrollment created"
		redirect_to [:edit, @seminar]
	end

	private
	def setup_enrollment
		@seminar = Seminar.find(params[:seminar_id])
		@enrollment = @seminar.seminar_students.find(params[:id]) unless params[:id].blank?
	end
end
