class Teacher < ActiveRecord::Base
  mount_uploader :avatar, AvatarTeacherUploader
  mount_uploader :cv, CvTeacherUploader
  has_and_belongs_to_many :courses
end
