class Course < ActiveRecord::Base
	has_many :lectures
	has_many :course_lecturers
	has_many :lecturers, :through => :course_lecturers

	scope :for_lecturer, lambda{|x| { :conditions => ["EXISTS(select * FROM course_lecturers WHERE course_id = courses.id AND lecturer_user_id = ?)", x.id] } }
	scope :active, :conditions => { :active => true }
	scope :published, :conditions => { :active => true, :published => true }
	scope :name_order, :order => "name ASC"

	def viewable_by?(u)
		return false unless active?
		return true if published?
		return editable_by?(u)
	end

	def editable_by?(u)
		return lecturers.include?(u)
	end

	def public_identifier
		if code.blank?
			name
		else
			"#{name} (#{code})"
		end
	end
end
