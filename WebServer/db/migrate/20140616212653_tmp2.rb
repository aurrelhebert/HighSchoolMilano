class Tmp2 < ActiveRecord::Migration
  def change
    remove_column :courses, :program
    add_column :courses, :program, :text
  end
end
