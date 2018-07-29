class Ncourse < ActiveRecord::Base
  belongs_to :student_record
  belongs_to :concentration
  belongs_to :professor
  has_many :students
  has_many :grades

  def student_roster
    Student.where(self.student_id = id)
  end


end
