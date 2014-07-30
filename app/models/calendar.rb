class Calendar < ActiveRecord::Base


	belongs_to :report

	validates_uniqueness_of :day_of_month, :scope => [:report_id, :month, :year]


	def self.load
		self.load_calendar
		self.load_holidays
		self.load_periods
	end


	def self.load_calendar
		months = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]
		week_day = ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo"]
		attributes = ["month", "week_day", "day_of_month", "holiday", "year"]
		years = [2015] # 2016, 2017, 2018]
		week_day_index = 3
		month_index = 0

		years.each do |year|
			day_of_month = [(1..31), (1..28), (1..31), (1..30), (1..31), (1..30), (1..31), (1..31), (1..30), (1..31), (1..30), (1..31)]
			if year%4 == 0 
			 if year%100 != 0 || year%400
				day_of_month = [(1..31), (1..29), (1..31), (1..30), (1..31), (1..30), (1..31), (1..31), (1..30), (1..31), (1..30), (1..31)]
			end
		end


				day_of_month.each do |days_of_month|
					
									days_of_month.each do |day|
										week_day_index %= 7
										params = []
										params << months[month_index%12]
										params << week_day[week_day_index]
										params << day
										params << false
										params << year
										ready  = Hash[attributes.zip params]
										calendar_day = Calendar.new(ready)
										calendar_day.save
										week_day_index += 1
										no_importa = []
										
									end
					month_index += 1
				end
			end

	end

	def self.load_holidays
		holidays = []
		holidays << Calendar.where("month = ? AND day_of_month = ?", "Enero", 1)
		holidays << Calendar.where("month = ? AND day_of_month = ?", "Enero", 12)
		holidays << Calendar.where("month = ? AND day_of_month = ?", "Febrero", 16)
		holidays << Calendar.where("month = ? AND day_of_month = ?", "Febrero", 17)
		holidays << Calendar.where("month = ? AND day_of_month = ?", "Marzo", 23)
		holidays << Calendar.where("month = ? AND day_of_month = ?", "Marzo", 29)
		holidays << Calendar.where("month = ? AND day_of_month = ?", "Abril", 2)
		holidays << Calendar.where("month = ? AND day_of_month = ?", "Abril", 3)
		holidays << Calendar.where("month = ? AND day_of_month = ?", "Abril", 5)
		holidays << Calendar.where("month = ? AND day_of_month = ?", "Mayo", 1)
		holidays << Calendar.where("month = ? AND day_of_month = ?", "Mayo", 18)
		holidays << Calendar.where("month = ? AND day_of_month = ?", "Junio", 8)
		holidays << Calendar.where("month = ? AND day_of_month = ?", "Junio", 15)
		holidays << Calendar.where("month = ? AND day_of_month = ?", "Junio", 29)
		holidays << Calendar.where("month = ? AND day_of_month = ?", "Julio", 20)
		holidays << Calendar.where("month = ? AND day_of_month = ?", "Agosto", 7)
		holidays << Calendar.where("month = ? AND day_of_month = ?", "Agosto", 17)
		holidays << Calendar.where("month = ? AND day_of_month = ?", "Octubre", 12)
		holidays << Calendar.where("month = ? AND day_of_month = ?", "Noviembre", 2)
		holidays << Calendar.where("month = ? AND day_of_month = ?", "Noviembre", 16)
		holidays << Calendar.where("month = ? AND day_of_month = ?", "Diciembre", 8)
		holidays << Calendar.where("month = ? AND day_of_month = ?", "Diciembre", 25)

		holidays.flatten!

		holidays.each do |day|
			#if day.id < 366
				day.holiday = true
				day.save
		 #end
		end

	end

 def holiday?
 	self.holiday == true
 end

 def self.load_periods
 	(12..115).each do |day|
 		uno = Calendar.find(day)
 		uno.period = 1
 		uno.save
 	end
 	(124..227).each do |day|
 		uno = Calendar.find(day)
 		uno.period = 2
 		uno.save
 	end
 	(243..346).each do |day|
 		uno = Calendar.find(day)
 		uno.period = 3
 		uno.save
 	end
 end


end





	








