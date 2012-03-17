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

	def grade
		@active_lecture_questions = params[:quiz_lecture_question_ids].split(",").map{|x| @lecture.lecture_questions.find(x)}.compact
		num_questions = @active_lecture_questions.size
		@num_correct = 0
		@active_lecture_questions.each do |q|
			given_answer = params["answer_#{q.id}"].to_i
			if given_answer == q.answer_number
				@num_correct = @num_correct + 1
			end
		end

		@passed = @num_correct >= @lecture.number_correct_passing_forced

		unless current_user.nil?
			@student_lecture_grade = StudentLectureGrade.create!(
				:student_user => current_user,
				:lecture => @lecture,
				:number_questions => @lecture.number_quiz_questions_forced,
				:number_answers_correct => @num_correct,
				:passed => @passed
			)
		end
	end

	private

	def setup_lecture
		@course = Course.find(params[:course_id]) unless params[:course_id].blank?
		@lecture = Lecture.find(params[:id]) unless params[:id].blank?
	end
end
