class Course < ActiveRecord::Base
  has_many :books, dependent: :destroy
  validates :title, presence: true

end
