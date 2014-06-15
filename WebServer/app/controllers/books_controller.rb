class BooksController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
    @book = @course.books.create(book_params)
    redirect_to course_path(@course)
  end

  def show

  end

  def destroy
    @course = Course.find(params[:course_id])
    @book = @course.books.find(params[:id])
    @book.destroy
    redirect_to course_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :desc)
  end


end
