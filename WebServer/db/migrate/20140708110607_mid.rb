class Mid < ActiveRecord::Migration
  def change
    add_column :timetables, :course_title, :string
  end
end
