class Tmp < ActiveRecord::Migration
  def change
    remove_column :courses, :day
    add_column :courses, :day, :integer
  end
end
