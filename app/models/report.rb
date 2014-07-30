class Report < ActiveRecord::Base

	belongs_to :user
	belongs_to :course
	has_many   :calendars
	validates  :course_start_time, presence: true



	def course_name
		@course_name = Course.find(self.course_id).name
	end

	def add_days
		course_days = []
		course_days << Calendar.where("week_day = ? AND period = ?", "#{self.week_day}", "#{self.period}")
		course_days.flatten!
		course_days.each do |day|
			new_day = day.dup
			new_day.report_id = self.id
			new_day.save
		end
	end

	def month_interval(requested_month_start, requested_month_finish)
		uno = Calendar.where("month = ? AND day_of_month = ?", "#{requested_month_start}", 25).first.id
    dos = Calendar.where("month = ? AND day_of_month = ?", "#{requested_month_finish}", 25).first.id
    @month_interval = []
    self.calendars.each do |day|
    	if day.month == requested_month_start && day.day_of_month > 25
    		@month_interval << day
    	end
    	if day.month == requested_month_finish && day.day_of_month <= 25
    		@month_interval << day
    	end
	end
	@month_interval
end

end
