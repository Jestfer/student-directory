def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # ask for cohort
    puts "Which cohort do you belong to?"
    cohort = gets.chomp
    cohort == "" ? cohort = "Mmm... must be from the Heroes Academy" : cohort = cohort.to_sym
    # add the student hash to the array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
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
  cohorts = []

  students.each do |sentence|
    if !cohorts.include?(sentence[:cohort])
      cohorts << sentence[:cohort]
    end
  end

  # Iterate over cohorts
  cohorts.each do |cohort|
    # Then we iterate, again, through all the names per cohort, until there are
    # no more names and, then, no more cohorts
    students.each do |hash|
      puts hash[:name] if hash[:cohort] == cohort
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
