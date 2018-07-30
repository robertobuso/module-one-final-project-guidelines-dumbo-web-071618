class User
  attr_accessor :first_name, :last_name, :role
  @@all = []

  def initialize (first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @@all << self
    @role = "New"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def validate
    if Professor.find_by(first_name: first_name, last_name: last_name)
      @role = "Professor"
      puts "Welcome back, Professor #{last_name}."
    elsif Student.find_by(first_name: first_name, last_name: last_name)
      @role = "Student"
      puts "Welcome back, #{first_name}!"
    else
      create_new_role
    end
  end

#Change .new to .create after testing 35, 39
  def create_new_role
    puts "Welcome to your first visit to the Academic Database. Please tell us if you are a:\n\n1) student\n2) professor\n\n".yellow

    input = gets.chomp

    if input == "1" || input == "student"
      @@user = Student.new(first_name: first_name, last_name: last_name)
      @role = "Student"
      puts "You are now a student in the system."
#How do we get user to inherit from Student Class???

    elsif input == "2" || input == "professor"
      @@user = Professor.new(first_name: first_name, last_name: last_name)
      @role = "Professor"
      puts "You are now a Professor in the system."
#How do we get user to inherit from Professor Class???

    else puts "I don't understand #{input}. Please type either the number or the type of role. Thank you."
    end
  end

end
