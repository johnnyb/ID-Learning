class Lecture < ActiveRecord::Base
	belongs_to :course
	
	scope :position_order, :order => "position ASC"
end
