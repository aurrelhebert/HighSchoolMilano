class TimetablesController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
    @timetable = @course.timetables.create(timetable_params)
    redirect_to edit_course_path(@course)
  end

  def destroy
    @course = Course.find(params[:course_id])
    @timetable = @course.timetables.find(params[:id])
    @timetable.destroy
    redirect_to edit_course_path(@course)
  end

  private
  def timetable_params
    params.require(:timetable).permit(:hour, :day)
  end
end