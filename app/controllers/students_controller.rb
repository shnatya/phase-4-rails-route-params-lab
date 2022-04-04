class StudentsController < ApplicationController

  def index
    if params[:name]
      students = Student.where("first_name = ? OR last_name = ?", params[:name].capitalize, params[:name].capitalize)
    else
      
      students = Student.all
    end
    render json: students
  end

  def show
    student = Student.find_by_id(params[:id])
    if student
      render json: student
    else
      render json: { error: 'Student not found' }, status: 404
    end
  end
end
