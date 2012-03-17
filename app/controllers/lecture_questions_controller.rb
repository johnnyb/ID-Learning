class LectureQuestionsController < ApplicationController
	before_filter :setup_lecture_question

	def create
		@lecture_question = @lecture.lecture_questions.create!(params[:lecture_question])
		flash[:notice] = "Question successfully added"
		redirect_to [:edit, @course, @lecture]
	end

	def update
		@lecture_question.update_attributes!(params[:lecture_question])
		flash[:notice] = "Question successfully updated"
		redirect_to [:edit, @course, @lecture]
	end

	def destroy
		@lecture_question.destroy
		flash[:notice] = "Question successfully destroyed"
		redirect_to [:edit, @course, @lecture]
	end

	private

	def setup_lecture_question
		@course = Course.find(params[:course_id])
		@lecture = Lecture.find(params[:lecture_id])
		@lecture_question = LectureQuestion.find(params[:id]) unless params[:id].blank?
	end
end
