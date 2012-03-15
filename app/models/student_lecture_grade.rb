class StudentLectureGrade < ActiveRecord::Base
	belongs_to :student_user, :foreign_key => "student_user_id", :class_name => "User"
	belongs_to :lecture

	scope :recent_first, :order => "id DESC"
end
