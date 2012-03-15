class LectureQuestion < ActiveRecord::Base
	MAX_ANSWERS = 8
	belongs_to :lecture
	
	def answers
		@answers ||= begin
			vals = []
			1.upto(MAX_ANSWERS) do |idx|
				ans = send("answer_text_#{idx}")
				unless ans.blank?
					vals.push([ans, idx])
				end
			end
		end
	end
end
