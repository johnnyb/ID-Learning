class LectureQuestion < ActiveRecord::Base
	MAX_ANSWERS = 8
	belongs_to :lecture

	scope :oldest_first, :order => "id ASC"
	
	def answers
		@answers ||= begin
			vals = []
			1.upto(MAX_ANSWERS) do |idx|
				ans = send("answer_text_#{idx}")
				unless ans.blank?
					vals.push([ans, idx])
				end
			end

			vals
		end
	end

	def valid_question?
		return false if answer_number.nil?
		return false if question_text.blank?
		return false if answers.empty?
		return true
	end
end
