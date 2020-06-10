class StudentsController < ApplicationController

  def index
    @students = Student.all
    #render :'index'
  end

  def show
    @student = Student.find_by(id: params[:id])
    #render :'show'
  end

  def new
    @student = Student.new
  end

  def create
    #byebug
    @student = Student.new(student_params)
    #@student.name = params[:student][:name]
    #whenever we use mass assignment, we have to approve the attributes that are allowed to be assigned to the new instance
    #the whole purpose here is to be explicit about which attributes we are allowing to be set so that other people can't input bad values into our database 
    if @student.save
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  #strong params declare which attributes we are allowing to be added/modified in this request

  private #these are like helper methods for this specific controller. They cannot be used as methods accessed by routes

  def student_params
    params.require(:student).permit(:name, :age, :grade)
  end

end
