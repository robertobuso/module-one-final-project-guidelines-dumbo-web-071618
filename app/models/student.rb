
class Student < ActiveRecord::Base
  has_many :courses
  belongs_to :student_record
  belongs_to :admin
  has_many :grades, through: :student_records
  has_many :professors, through: :courses

  def add_course(course)
    if record_by_course(course).nil?
      StudentRecord.create(student_id: self.id, course_id: course.id, professor_id: course.professor_id)
    else
      puts "You are already enrolled in #{course.title}."
    end
  end

  def add_course_by_title(title)
    course = Course.find_by(title: title)
    if course.nil?
      puts "This course does not exist."
    elsif StudentRecord.find_by(course_id: course.id, student_id: self.id).nil?
      StudentRecord.create(student_id: self.id, course_id: course.id, professor_id: course.professor_id)
    else
      puts "You are already enrolled in #{course.title}."
    end
  end

  def drop_course_by_title(title)
    course = Course.find_by(title: title)
    if StudentRecord.find_by(course_id: course.id, student_id: self.id).nil?
      puts "You are not enrolled in #{course.title}."
    else
      StudentRecord.find_by(student_id: self.id, course_id: course.id).delete
      puts "You have dropped the following course: #{course.title}."
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
    puts "How would you like to order your courses?\n\n1) By Title\n\n2) By Professor\n\n3) By Grade\n\n"

    input = gets.chomp

    case input
    when "1"
      my_courses
    when "2"
      my_courses_by_professor
    when "3"
      puts "STILL WORKING ON THE GRADES!"
    else
      "Please type 1, 2 or 3."
    end
  end

  def my_courses_by_professor
    my_course_ids = StudentRecord.where(student_id: self.id).select(:course_id)
    if my_course_ids.length == 0
      puts "You are not enrolled in any courses at the moment."
      else
      puts "Dear #{first_name},\n\nYou are currently enrolled in the following courses:\n"

      my_course_ids.each do |course|
        my_professor_id = Course.find(course.course_id).professor_id
        my_course_title = Course.find(course.course_id).title
        my_professor_name = Professor.find(my_professor_id).full_name

        puts "Professor\n#{my_professor_name}\n\nCourse\n#{my_course_title}\n\n\n"
      end
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def record_by_course(course)
    StudentRecord.find_by(student_id: self.id, course_id: course.id)
  end

private

  def my_courses
    my_course_ids = StudentRecord.where(student_id: self.id).select(:course_id)
    if my_course_ids.length == 0
      puts "You are not enrolled in any courses at the moment."
      else
      puts "Dear #{first_name},\n\nYou are currently enrolled in the following courses:\n"
      my_course_ids.map do |id|
        Course.find_by(id: id.course_id).title
      end
    end
  end
end
