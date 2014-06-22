class AddCvToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :cv, :string
  end
end
