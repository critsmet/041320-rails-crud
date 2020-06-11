class StudentsController < ApplicationController
  before_action :find_student, except: [:index, :new, :create]

  def index
    @students = Student.all
    #render :'index'
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    #byebug
    @student = Student.new(student_params(:name, :age, :grade))
    #@student.name = params[:student][:name]
    #whenever we use mass assignment, we have to approve the attributes that are allowed to be assigned to the new instance
    #the whole purpose here is to be explicit about which attributes we are allowing to be set so that other people can't input bad values into our database
    if @student.save
      flash[:message] = "Successfully created!"
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @student.update(student_params(:name, :age, :grade))
      redirect_to student_path(@student)
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path
  end


  #strong params declare which attributes we are allowing to be added/modified in this request

  private #these are like helper methods for this specific controller. They cannot be used as methods accessed by routes

  def find_student
    @student = Student.find_by(id: params[:id])
  end

  def student_params(*args)
    params.require(:student).permit(*args)
  end


end
