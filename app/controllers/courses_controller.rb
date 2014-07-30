class CoursesController < ApplicationController
  
  before_action :authenticate_user!

  def new
  end

  def edit
  end

  def show
  end

  def create
    @course = current_user.courses.new(course_params)
  end

  def destroy
  end

  def index
    @course_names = Course.all
  end

    private

  def course_params
    allow = [:carrera, :semestre, :nombre, :dia_semana, :hora_inicio, :duracion]
    params.require(:course).permit(allow)
  end
end

