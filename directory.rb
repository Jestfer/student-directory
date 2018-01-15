def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  
  while !name.empty? do
    puts "What's his/her hobbie?"
    hobbie = gets.chomp
    hobbie == "" ? hobbie = "Nothing" : hobbie

    puts "What's his/her country of birth?"
    cob = gets.chomp

    # add the student hash to the array
    students << {name: name, cohort: :november, hobbie: hobbie, cob: cob}
    puts "Now we have #{students.count} students"

    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort), enjoys #{student[:hobbie]} and was born in #{student[:cob]}"
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
