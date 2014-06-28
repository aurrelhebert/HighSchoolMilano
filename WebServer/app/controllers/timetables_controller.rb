class TimetablesController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
    @timetable = @course.timetables.create(timetable_params)
    @course.timetables.to_a.sort_by! { |m| m.day}

    respond_to do |format|
      if @course.save
        format.html { redirect_to edit_course_path(@course)+'#timetable', notice: 'Timetable was successfully created.'}
      else
        format.html { redirect_to edit_course_path(@course), notice: 'Erreur' }
      end
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @timetable = @course.timetables.find(params[:id])
    @timetable.destroy
    redirect_to edit_course_path(@course)+'#timetable'
  end

  private
  def timetable_params
    params.require(:timetable).permit(:hour, :day, :room, :course_title)
  end
end