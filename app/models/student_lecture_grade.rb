class StudentLectureGrade < ActiveRecord::Base
	belongs_to :student_user, :foreign_key => "student_user_id", :class_name => "User"
	belongs_to :lecture

	scope :for_student, lambda{|x| { :conditions => { :student_user_id => x.id } } }
	scope :for_lecture, lambda{|x| { :conditions => { :lecture_id => x.id } } }
	scope :passed, :conditions => { :passed => true }

	scope :recent_first, :order => "id DESC"
end
