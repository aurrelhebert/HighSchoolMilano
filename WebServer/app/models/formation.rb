class Formation < ActiveRecord::Base
  has_many :courses
  validates :name, presence: true,
            length: { minimum: 5 }
end
