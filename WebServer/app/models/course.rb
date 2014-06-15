class Course < ActiveRecord::Base
  has_many :books, dependent: :destroy
  belongs_to :formation
  validates :title, presence: true

end
