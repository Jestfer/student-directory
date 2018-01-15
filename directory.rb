def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.delete("\n")
  # while the name is not empty, repeat this code
  while !name.empty? do
    # ask for cohort
    puts "Which cohort do you belong to?"
    cohort = gets.delete("\n")
    cohort == "" ? cohort = "Mmm... must be from the Heroes Academy" : cohort = cohort.to_sym
    # add the student hash to the array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.delete("\n")
  end
  # return the array of students
  p students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student"
  else
    puts "Overall, we have #{students.count} great students"
  end
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
