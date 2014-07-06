class AddProgramToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :program, :text
  end
end
