class Lecture < ActiveRecord::Base
	belongs_to :course
	has_many :lecture_links

	scope :active, :conditions => { :active => true }	
	scope :position_order, :order => "position ASC"

	def editable_by?(u)
		return course.editable_by?(u)
	end
	
	def public_identifier
		name
	end
end
