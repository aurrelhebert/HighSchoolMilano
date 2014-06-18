class Timetable < ActiveRecord::Base
  belongs_to :course
  validates :day, presence: true
end
