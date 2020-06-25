class StudentsController < ApplicationController

  before_action :current_student, only: [:show, :edit, :update]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
    @instructors = Instructor.all
  end

  def create
    @student = Student.new(student_params)
    @instructor = Instructor.find(student_params[:instructor_id])
    if @student.valid?
      @student.save
      redirect_to instructor_path(@instructor)
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to new_student_path
    end
  end

  def edit
    @student = current_student
    @instructors = Instructor.all
    @instructor = Instructor.find(@student.instructor_id)
  end

  def current_student
    @student = Student.find(params[:id])
  end

  def update
    @student.update(student_params)
    @instructor = Instructor.find(@student.instructor_id)
    if @student.valid?
      @student.save
      redirect_to instructor_path(@instructor)
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to edit_student_path(@student)
    end
  end

  def student_params
    params.require(:student).permit(:name, :major, :instructor_id, :age)
  end
  
end
