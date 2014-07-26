class Course < ActiveRecord::Base

	belongs_to :user





	def course_names
		doc = Roo::Excel.new('/Users/carlosalbertosalgadohazbun/Desktop/CourseLibrary.xls')
		doc.column(2)
		
	end


end
