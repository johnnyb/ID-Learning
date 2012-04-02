class Seminar < ActiveRecord::Base
	belongs_to :professor_user, :class_name => "User", :foreign_key => "professor_user_id"
	has_many :seminar_students
	has_many :student_users, :through => :seminar_students

	scope :active, :conditions => { :active => true } 
	scope :public, :conditions => { :public => true }
	scope :enrolling, :conditions => { :active => true, :enrollment_closed => false, :completed => false, :published => true }
	scope :for_professor, lambda{|x| { :conditions => { :professor_user_id => x.id } } } 

	def enrollment_status(u)
		return "PROFESSOR" if professor_user == u
		susers = student_users.for_student_user(u).to_a
		return "UNENROLLED" if susers.empty?
		return "ENROLLED" unless susers.select{|x| x.confirmed?}.empty?
		return "PENDINGSTUDENT" unless susers.select{|x| x.student_confirmed?}.empty?
		return "PENDINGPROFESSOR" unless susers.select{|x| x.professor_confirmed?}.empty?
		return "REJECTED" unless susers.select{|x| x.rejected?}.empty?
		return "UNKNOWN"
	end
end
