
class Nstudent < ActiveRecord::Base
  has_many :courses
  belongs_to :student_record
  belongs_to :admin
  has_many :grades, through: :student_records
  has_many :professors, through: :courses

  def full_name
    "#{first_name} #{last_name}"
  end

  def create_record
    my_record = StudentRecord.create(student_id: self.id)
  end

  def add_course(course)
    new_course = Course.find_by(title: course.title)
    if new_course.student_record == my_record.id
      puts "You are already enrolled in #{course.title}."
    else
      my_record.update(courses: new_course)
    end
  end

end
