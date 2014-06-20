require 'carrierwave/orm/activerecord'

class Course < ActiveRecord::Base
  has_many :books, dependent: :destroy
  has_many :timetables, dependent: :destroy
  belongs_to :formation
  validates :title, presence: true
  mount_uploader :avatar, Avatar_Uploader

end
