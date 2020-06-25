class InstructorsController < ApplicationController

  before_action :current_instructor, only: [:show, :edit, :update]

  def index
    @instructors = Instructor.all
  end

  def show
    @average_student_age = @instructor.average_student_age
  end

  def current_instructor
    @instructor = Instructor.find(params[:id])
  end

  def instructor_params
    params.require(:instructor).permit(:name)
  end
end
