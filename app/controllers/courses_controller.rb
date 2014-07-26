class CoursesController < ApplicationController
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
    doc = Roo::Excel.new('/Users/carlosalbertosalgadohazbun/Desktop/CourseLibrary.xls')
    @course_names = doc.column(2)
  end

    private

  def course_params
    allow = [:carrera, :semestre, :nombre, :dia_semana, :hora_inicio, :duracion]
    params.require(:course).permit(allow)
  end
end
