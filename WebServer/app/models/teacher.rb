class Teacher < ActiveRecord::Base
  mount_uploader :avatar, AvatarTeacherUploader
  mount_uploader :cv, CvTeacherUploader
end
