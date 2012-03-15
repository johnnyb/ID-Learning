class LecturesController < ApplicationController
	before_filter :setup_lecture

	def create
		@lecture = @course.lectures.build(params[:lecture])
		@lecture.position = last_position(@course.lectures) + 1
		@lecture.save!
		flash[:notice] = "Lecture successfully saved"
		redirect_to [:edit, @course, @lecture]
	end

	def update
		@lecture.update_attributes!(params[:lecture])
		flash[:notice] = "Lecture successfully updated"
		redirect_to [:edit, @course, @lecture]
	end

	def destroy
		@lecture.active = false
		@lecture.save!
		flash[:notice] = "Lecture successfully deleted"
		redirect_to [:edit, @course]
	end

	def sort
		sort_array_with_position(@course.lectures, params[:sortOrder])
		render :nothing => true
	end

	private

	def setup_lecture
		@course = Course.find(params[:course_id]) unless params[:course_id].blank?
		@lecture = Lecture.find(params[:id]) unless params[:id].blank?
	end
end
