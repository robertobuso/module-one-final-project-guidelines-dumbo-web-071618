
class Student < ActiveRecord::Base
  has_many :courses
  belongs_to :student_record
  belongs_to :admin
  has_many :grades, through: :student_records
  has_many :professors, through: :courses

  def full_name
    "#{first_name} #{last_name}"
  end

  def create_record
    if StudentRecord.find_by(student_id: self.id) == nil
      StudentRecord.create(student_id: self.id)
      puts "You now have a student record."
    else puts "You already have a student record."
    end
  end

  def record_by_course(course)
    StudentRecord.find_by(student_id: self.id, course_id: course.id)
  end

  def add_course(course)
    if record_by_course(course).nil?
      StudentRecord.create(student_id: self.id, course_id: course.id)
    else
      puts "You are already enrolled in #{course.title}."
    end
  end

  def drop_course(course)
    if record_by_course(course).nil?
      puts "You are not currently enrolled in this course."
    else record_by_course(course).delete
      puts "You have dropped the following course: #{course.title}."
    end
  end

  def list_courses
    my_course_ids = StudentRecord.where(student_id: self.id).select(:course_id)
    if my_course_ids.length == 0
      puts "You are not enrolled in any courses at the moment."
      else
      puts "Dear #{first_name},\n\nYou are currently enrolled in the following courses:\n"
      my_course_ids.map do |id|
        Course.find(id.course_id).title
      end
    end
  end
end
