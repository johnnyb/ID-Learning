class SeminarStudent < ActiveRecord::Base
	belongs_to :seminar
	belongs_to :student_user, :class_name => "User", :foreign_key => "student_user_id"

	named_scope :for_student_user, lambda{|x| { :conditions => { :student_user_id => x.id } } } 
end
