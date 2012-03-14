class CoursesController < ApplicationController
	before_filter :authenticate_user!, :only => [:new, :edit, :update, :destroy, :create]
	before_filter :setup_course
	before_filter :course_editable, :only => [:edit, :update, :destroy]

	def update
		@course.update_attributes!(params[:course])
		flash[:notice] = "Course updated successfully"
		redirect_to [:edit, @course]
	end

	def create
		@course = Course.create!(params[:course])
		@course.course_lecturers.create!(:lecturer => current_user)
		flash[:notice] = "Course created successfully"
		redirect_to [:edit, @course]
	end

	def destroy
		@course.active = false
		@course.save!
		flash[:notice] = "Course successfully deleted"
		redirect_to mine_courses_path
	end

	def unpublish
		@course.published = false
		@course.save!
		flash[:notice] = "Course successfully unpublished"
		redirect_to [:edit, @course]
	end

	def publish
		@course.published = true
		@course.save!
		flash[:notice] = "Course successfully published"
		redirect_to [:edit, @course]
	end

	private

	def setup_course
		unless params[:id].blank?
			course = Course.find(params[:id]) 
			if course.viewable_by?(current_user)
				@course = course
			end
		end
	end

	def course_editable
		unless @course.editable_by?(current_user)
			flash[:warning] = "You don't have permission to access that course"
			redirect_to account_path
		end
	end
end
