class Seminar < ActiveRecord::Base
	belongs_to :professor_user
	has_many :seminar_students
	has_many :student_users, :through => :seminar_students

	scope :public, :conditions => { :public => true }
	scope :enrolling, :conditions => { :active => true, :enrollment_closed => false, :completed => false, :published => true }
end
