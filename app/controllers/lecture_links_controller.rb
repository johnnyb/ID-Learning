class LectureLinksController < ApplicationController
	before_filter :setup_lecture_link

	def create
		@lecture_link = @lecture.lecture_links.build(params[:lecture_link])
		@lecture_link.position = last_position(@lecture.lecture_links) + 1
		@lecture_link.save!

		flash[:notice] = "Link successfully created"

		redirect_to [:edit, @course, @lecture]
	end

	def update
		@lecture_link.update_attributes!(params[:lecture_link])
		flash[:notice] = "Link successfully updated"
		redirect_to [:edit, @course, @lecture]
	end

	def destroy
		@lecture_link.destroy
		flash[:notice] = "Link successfully deleted"
		redirect_to [:edit, @course, @lecture]
	end

	def sort
	end

	private
	def setup_lecture_link
		@course = Course.find(params[:course_id]) unless params[:course_id].blank?
		@lecture = Lecture.find(params[:lecture_id]) unless params[:lecture_id].blank?
		@lecture_link = LectureLink.find(params[:id]) unless params[:id].blank?
	end

end
