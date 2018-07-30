class Course < ActiveRecord::Base
  belongs_to :concentration
  belongs_to :professor
  belongs_to :student_record
  has_many :students
  has_many :grades

  def student_roster
    Student.where(self.student_id = id)
  end


end
