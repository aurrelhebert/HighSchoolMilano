class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.integer :hour
      t.integer :day
      t.references :course, index: true

      t.timestamps
    end
  end
end
