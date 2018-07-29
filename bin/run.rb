require_relative '../config/environment'

#Students
joan = Student.find(1)
mickey = Student.find(2)
ellie = Student.find(3)

#Courses
screenwriting_one = Course.find(1)
entertainment_law = Course.find(2)
sound_film_two = Course.find(3)

#Professors
jeremy = Professor.find(1)
eileen = Professor.find(2)
glen = Professor.find(3)

binding.pry

puts "HELLO WORLD"
