
class Grade < ActiveRecord::Base
  belongs_to :student_record
  has_many :courses
  has_many :students, through: :courses
  has_many :professors, through: :courses
end
