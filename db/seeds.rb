#Students
joan = Student.create(first_name: "Joan", last_name: "Floyd", gender: "female", race: "White", status: "Active")
mickey = Student.create(first_name: "Anthony", last_name: "Mickey", gender: "male", race: "Black", status: "Active")
ellie = Student.create(first_name: "Ellie", last_name: "Park", gender: "female", race: "Asian", status: "Graduated")

#Courses
screenwriting_one = Course.create(title: "Screenwriting - The Step Outline", description: "Students will learn how to conceive the main elements of a featurelength screenplay and deliver a detailed step outline for a film.", day: "Saturday", time: "10:00:00", semester: "Spring")

entertainment_law = Course.create(title: "Entertainmment Law for Independent Filmmakers", description: "The objective of this class is to ensure that you are an informed filmmaker who can anticipate certain legal and business issues that may arise with your project. Using real-life case studies
as basis for discussion, students in this course will explore the legal and business affairs aspect of filmmaking. We will discuss option agreements, distribution agreements, production-related agreements, delivering legal materials to distributors, music and clip clearances, and fair use and guild considerations.", day: "Friday", time: "15:00:00", semester: "Fall")

sound_film_two = Course.create(title: "Sound on Film 2", description: "The final course in the sound concentration sequence, this course is focused on composing and sound designing a longer-form capstone work in collaboration with a filmmaker also in the
MA program. Final grade is based on the quality of the finished product and an evaluation by the instructor of how the student incorporated knowledge and techniques introduced in the previous three classes.", day: "Monday", time: "01:00:00", semester: "Spring")
