class Professor < ActiveRecord::Base
  has_many :courses
  has_many :students, through: :courses
  has_many :student_records
  belongs_to :admin

  def full_name
    "#{first_name} #{last_name}"
  end

  def create_course(title, description, day, time, semester)
    # new_course_info = (professor_id: self.id, title: title, description: description, day: day, time: time, semester: semester)
    if Course.find_by(professor_id: self.id, title: title).nil?
      Course.create(professor_id: self.id, title: title, description: description, day: day, time: time, semester: semester)
    else puts "This course already exists."
    end
  end

  def delete_course_by_title(title)
    course = Course.find_by(title: title, professor_id: self.id)
    if course == nil
      puts "This course does not exist currently."
    else
      course.delete
      puts "You successfully deleted the course #{course.title}."
    end
  end

  def add_grade(student, course, grade)
    if course.professor_id != self.id
      puts "This is not one of your courses. You may not input or change grades."
    elsif course_by_student(student, course).grade.nil? || course_by_student(student, course).nil?
      course_by_student(student, course).update(grade: grade)
    else
      puts "#{student.full_name} already has a grade of #{course_by_student(student, course).grade} for #{course.title}. Do you want to change it? (Y or N)\n"
      input = gets.chomp
      if input == "Y"
        change_grade(student, course, grade)
      else puts "The original grade will remain unchanged."
      end
    end
  end

  def change_grade(student, course, grade)
    course_by_student(student, course).update(grade: grade)
    puts "#{student.full_name} now has a grade of #{course_by_student(student, course).grade}."
  end

  def course_by_student(student, course)
    StudentRecord.find_by(course_id: course.id, student_id: student.id)
  end

end
