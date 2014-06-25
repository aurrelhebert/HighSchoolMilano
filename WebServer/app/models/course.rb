require 'carrierwave/orm/activerecord'

class Course < ActiveRecord::Base
  has_many :books, dependent: :destroy
  has_many :timetables, dependent: :destroy
  belongs_to :formation
  has_and_belongs_to_many :teachers
  validates :title, presence: true
  mount_uploader :avatar, Avatar_Uploader
  accepts_nested_attributes_for :courses_teachers, :allow_destroy => true
end
