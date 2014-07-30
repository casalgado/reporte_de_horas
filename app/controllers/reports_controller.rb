class ReportsController < ApplicationController

  before_action :authenticate_user!

  def new
    @month = Time.now.month
    if    [1,2,3,4].include?(@month) then @default_period = 1 end
    if    [5,6,7,8].include?(@month) then @default_period = 2 end
    if [9,10,11,12].include?(@month) then @default_period = 3 end    
  @my_reports = current_user.reports
  @array_for_options = Course.array_for_options
  @user = current_user
  @array_for_days = Course.array_for_days
  @array_for_period = [["Invierno", 1], ["Verano", 2], ["Otoño", 3]]
  end

  def my_reports
    @my_reports = current_user.reports
    @my_reports
  end

  def calendar_reports
    @my_reports = current_user.reports
    @my_reports.each do |report|
      report.add_days
    end
    @my_reports = current_user.reports.where("period = ?", params[:period])
    @period = params[:period]

  end


  def monthly_reports
    @start  = params[:start]
    @finish = params[:finish]
    #uno = Calendar.where("month = ? AND day_of_month = ?", "#{@requested_month_start }", 25).first.id
    #dos = Calendar.where("month = ? AND day_of_month = ?", "#{@requested_month_finish}", 25).first.id
    @my_reports = current_user.reports.where("period = ?", params[:period])
    @period = params[:period]

  end

  def update
    @report = Report.find(params[:id])
    @report.update_attributes(report_params)
    @report.save
    hello = []
    redirect_to my_reports_user_reports_path
  end
    
  
  def show
  end

  def edit
    @report = Report.find(params[:id])
    @month = Time.now.month
    if    [1,2,3,4].include?(@month) then @default_period = 1 end
    if    [5,6,7,8].include?(@month) then @default_period = 2 end
    if [9,10,11,12].include?(@month) then @default_period = 3 end    
    @my_reports = current_user.reports
    @array_for_options = Course.array_for_options
    @array_for_days = Course.array_for_days
    @array_for_period = [["Invierno", 1], ["Verano", 2], ["Otoño", 3]]
  end

  def create

    @report = current_user.reports.new(report_params)
    @report.save
    redirect_to :back

  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to my_reports_user_reports_path
  end

  def index

  end

  private
  def report_params
    allow = [:course_id, :week_day, :course_start_time, :period]
    params.require(:report).permit(allow)
  end

end


