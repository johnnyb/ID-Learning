class Seminar < ActiveRecord::Base
	belongs_to :professor_user, :class_name => "User", :foreign_key => "professor_user_id"
	has_many :seminar_students
	has_many :student_users, :through => :seminar_students

	scope :active, :conditions => { :active => true } 
	scope :public, :conditions => { :public => true }
	scope :enrolling, :conditions => { :active => true, :enrollment_closed => false, :completed => false, :published => true }
	scope :for_professor, lambda{|x| { :conditions => { :professor_user_id => x.id } } } 
end
