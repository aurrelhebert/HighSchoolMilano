class Teacher < ActiveRecord::Base
  mount_uploader :avatar, AvatarTeacherUploader
end
