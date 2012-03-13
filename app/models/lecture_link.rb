class LectureLink < ActiveRecord::Base
	belongs_to :lecture

	scope :position_order, :order => "position ASC"
end
