class Course < ActiveRecord::Base

	has_many :reports
	has_many :users, through: :reports

	def self.load
		doc = Roo::Excel.new('/Users/carlosalbertosalgadohazbun/Desktop/reporte_de_horas/lib/assets/CourseLibrary.xls')
		doc.row(2)
		header = doc.row(1)
			(2..9).each do |count|
				db_row = doc.row(count)
				params = Hash[header.zip db_row]
				course = Course.new(params)
				course.save
			end		
	end

	def self.array_for_options
		all = Course.all
		@array_for_options = []
		all.each do |course|
			initial = []
			initial << course.name
			initial << course.id
			@array_for_options << initial
		end
		@array_for_options
		
	end

	def self.array_for_days
		dias = ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado"]
		@array_for_days = []
		dias.each do |dia|
			initial = []
			initial << dia
			initial << dia
			@array_for_days << initial
		end
		@array_for_days
	end


end
