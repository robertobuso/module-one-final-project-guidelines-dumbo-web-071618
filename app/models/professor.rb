class Professor < ActiveRecord::Base
  has_many :courses
  has_many :students, through: :courses
  has_many :grades, through: :courses
  belongs_to :admin

  def full_name
    "#{first_name} #{last_name}"
  end

  def list_students_all
    puts Course.where(professor_id: self.id).order(:student_id)
  end

  def course_student(student, course)
    StudentRecord.find_by(course_id: course.id, student_id: student.id)
  end

  def add_grade(student, course, grade)
    if course.professor_id != self.id
      puts "This is not one of your courses. You may not input or change grades."
    elsif course_student(student, course).grade.nil? || course_student(student, course).nil?
      course_student(student, course).update(grade: grade)
    else
      puts "#{student.full_name} already has a grade of #{course_student(student, course).grade} for #{course.title}. Do you want to change it? (Y or N)\n"
      input = gets.chomp
      if input == "Y"
        course_student(student, course).update(grade: grade)
        puts "#{student.full_name} now has a grade of #{course_student(student, course).grade}."
      else puts "The original grade will remain unchanged."
      end
    end
  end
end
