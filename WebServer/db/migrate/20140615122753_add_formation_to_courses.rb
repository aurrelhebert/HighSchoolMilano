class AddFormationToCourses < ActiveRecord::Migration
  def change
    add_reference :courses, :formation, index: true
  end
end
