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

	def unpublish
		@seminar.published = false
		@seminar.save!
		flash[:notice] = "Seminar successfully unpublished"
		redirect_to [:edit, @seminar]
	end

	def publish
		@seminar.published = true
		@seminar.save!
		flash[:notice] = "Seminar successfully published"
		redirect_to [:edit, @seminar]
	end

	def enrollment_open
		@seminar.enrollment_closed = false
		@seminar.save!
		flash[:notice] = "Enrollment successfully re-opened"
		redirect_to [:edit, @seminar]
	end

	def enrollment_close
		@seminar.enrollment_closed = true
		@seminar.save!
		flash[:notice] = "Enrollment successfully closed"
		redirect_to [:edit, @seminar]
	end

	# NOTE - these actions are for students managing their own enrollments, since they don't have direct access to the enrollment resource
	def enroll
		raise "Invalid role!" unless current_user.role_student?

		# We *shouldn't* get here if we already have requests, but just in case - DESTROY THEM
		@seminar.seminar_students.for_student_user(current_user).each{|x| x.destroy} 

		@enrollment = @seminar.seminar_students.create!(:student_user => current_user, :student_confirmed => true)
		flash[:notice] = "Enrollment requested"
		redirect_to @seminar
	end

	def enrollment_confirm
		@enrollment = @seminar.for_student_user(current_user).first

		raise "Error - the professor has not confirmed this enrollment yet #{@enrollment.id} !" unless @enrollment.professor_confirmed? && !@enrollment.rejected?

		@enrollment.student_confirmed = true
		@enrollment.confirmed = true
		@enrollment.save!

		flash[:notice] = "Enrollment successfully confirmed"

		redirect_to @seminar
	end

	def enrollment_reject
		@enrollment = @seminar.for_student_user(current_user).first
		@enrollment.student_confirmed = false
		@enrollment.rejected = true
		@enrollment.confirmed = false
		@enrollment.save!
		flash[:notice] = "Enrollment successfully rejected"
		redirect_to @seminar
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
