class Course < ActiveRecord::Base
  belongs_to :concentration
  belongs_to :professor
  belongs_to :student_record
  has_many :students
  has_many :grades

  def student_roster
    students_num = StudentRecord.where(course_id: self.id).select(:student_id)

    students_num.map do |student|
      Student.find(student.student_id).full_name
    end
  end
end
