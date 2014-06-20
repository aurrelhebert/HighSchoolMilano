class AddColumnTable < ActiveRecord::Migration
  def change
    add_column :timetables, :room, :text
  end
end
