class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :desc
      t.integer :startingHour
      t.integer :finishHour

      t.timestamps
    end
  end
end
