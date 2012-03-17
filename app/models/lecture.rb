class Lecture < ActiveRecord::Base
	belongs_to :course
	has_many :lecture_links
	has_many :lecture_questions

	scope :active, :conditions => { :active => true }	
	scope :position_order, :order => "position ASC"

	def editable_by?(u)
		return course.editable_by?(u)
	end
	
	def public_identifier
		name
	end

	def all_valid_questions
		lecture_questions.to_a.select{|x| x.valid_question?}
	end

	def number_quiz_questions_forced
		@number_quiz_questions_forced ||= begin
			sz1 = all_valid_questions.size
			sz2 = number_quiz_questions
			sz2.nil? ? sz1 : (sz2 > sz1 ? sz1 : sz2)
		end
	end

	def number_correct_passing_forced
		@number_correct_passing_forced ||= begin
			nq1 = number_quiz_questions_forced
			nq2 = number_correct_passing
			nq2.nil? ? nq1 : (nq2 > nq1 ? nq1 : nq2)
		end
	end
end
