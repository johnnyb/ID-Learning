class SeminarStudent < ActiveRecord::Base
	belongs_to :seminar
	belongs_to :student_user, :class_name => "User", :foreign_key => "student_user_id"
end
