class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.all
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
    @list_courses = Course.all
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: 'Teacher was successfully created.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  def pageTimetable
    @teacher = Teacher.find(params[:id])
    @list = []
    @teacher.courses.each do |course|
      course.timetables.each do |timetable|
        timetable.course_title = course.title
        @list << timetable
        end
      end
    @list_timetable = @list.to_a.sort_by {|m| [m.day, m.hour]}
    end

  def courses
    @teacher = Teacher.find(params[:id])
  end

  def cv
    @teacher = Teacher.find(params[:id])
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def display
    @teacher = Teacher.find(params[:id])
    @list = params[:act_checkbox]
    @teacher.courses.clear
    @list.each do |_id,v|
      if v == "1"
        @course = Course.find(_id)
        @teacher.courses<<@course
      end
    end
    redirect_to teacher_path(@teacher)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:firstName, :name, :desk, :phone, :email, :avatar, :cv)
    end
end
