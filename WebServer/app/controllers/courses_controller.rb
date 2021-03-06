class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
    @titre = "All courses"
    @description = "Here, you will find the list of all the Courses available in our High school :"
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @tour = params[:tour]
    @comeFromForm = params[:comeFromForm]
    @titre = @course.title
      if @course.year != nil
        @titre += '('+@course.year+')'
      end
  end

  # GET /courses/new
  def new
    @titre = "New course"
    @course = Course.new
    @course.teachers.build()
  end

  # GET /courses/1/edit
  def edit
    @titre = "Edit "+@course.title
    @teachers = @course.teachers
    @timetables = @course.timetables
    @list_teacher = Teacher.all
  end

  # GET /courses/1/pbook
  def pageBook
    @course = Course.find(params[:id])
    @titre = @course.title
    if @course.year != nil
      @titre += '('+@course.year+')'
    end
  end
  # GET /courses/1/pageTeacher
  def pageTeacher
    @course = Course.find(params[:id])
    @titre = 'The course '+ @course.title + ' is taught by :'
  end
  def pageTimetable
    @course = Course.find(params[:id])
    @titre = @course.title
    if @course.year != nil
      @titre += '('+@course.year+')'
    end
    @list = @course.timetables.to_a.sort_by {|m| [m.day, m.hour]}
  end
  # GET /courses/1/timetable
  # POST /courses
  # POST /courses.json
  def create
    @titre = "Creating a course"
    if params[:formation_id]
      @formation = Formation.find(params[:formation_id])
      @course = @formation.courses.create(course_params)
    else
      @course = Course.new(course_params)
    end
      if @course.save
        redirect_to edit_course_path(@course)
      else
        render 'new'
      end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def display
    @course = Course.find(params[:id])
    @list = params[:act_checkbox]
    @course.teachers.clear
    if @list
      @list.each do |_id,v|
         if v == "1"
           @teacher = Teacher.find(_id)
           @course.teachers<<@teacher
         end
      end
    end
    redirect_to course_path(@course)
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def course_params
    params.require(:course).permit(:title, :desc, :startingHour, :finishHour, :day, :program, :avatar, :avatar_cache, :teachers)
  end
end