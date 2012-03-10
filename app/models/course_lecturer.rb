class CourseLecturer < ActiveRecord::Base
	belongs_to :course
	belongs_to :lecturer, :class_name => "User", :foreign_key => "lecturer_user_id"
end
