class NstudentRecord < ActiveRecord::Base
  belongs_to :student
  has_many :courses
  has_many :grades
  has_many :professors, through: :courses
end
