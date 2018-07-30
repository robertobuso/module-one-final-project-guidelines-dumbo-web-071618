require_relative '../config/environment'

#To Test Before Admin - Assign Professors to Courses

#Students
joan = Student.find(25)
mickey = Student.find(26)
ellie = Student.find(27)

#Professors
jeremy = Professor.find(25)
eileen = Professor.find(26)
glen = Professor.find(27)

#Courses
screenwriting = Course.find(14)
law = Course.find(15)
sound = Course.find(16)


binding.pry

puts "HELLO WORLD"
